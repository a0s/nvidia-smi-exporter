require 'active_support/core_ext/object/blank'

class NVidiaSMI
  attr_reader :binary_path, :name_prefix, :query_list

  def initialize(binary_path:, query_list:, name_prefix: nil)
    @binary_path = binary_path
    @name_prefix = name_prefix
    @query_list = query_list
  end

  def query(query_list = @query_list)
    unless @binary_path.present?
      raise("Don't know path to nvidia-smi binary")
    end

    # Move uuid to first position
    query_list = ['uuid'] + (query_list - ['uuid'])

    query_string = query_list.join(',')
    stdout_and_stderr_str, status = Open3.capture2e(@binary_path, '--format=csv', "--query-gpu=#{query_string}")

    unless status.exitstatus.zero?
      raise(stdout_and_stderr_str)
    end

    stdout_and_stderr_str
  end

  def parse(str)
    lines = str.strip.split("\n")
    arrs = lines.inject([]) { |arr, line| arr << line.split(',').map(&:strip) }

    result = {}

    headers, *line_arrs = arrs
    return result if line_arrs.blank?

    headers.each_with_index do |column, index|
      raise('First column is not uuid') if index.zero? && column != 'uuid'
      next if index.zero?

      case column
      when /\A([^\[]+)\[(%)\]\z/
        multiplicator = 0.01
        unit = $2
        name_postfix = ''
      when /\A([^\[]+)\[(MiB)\]\z/
        multiplicator = 1_048_576
        unit = $2
        name_postfix = '_bytes'
      when /\A([^\[]+)\[(W)\]\z/
        multiplicator = 1
        unit = $2
        name_postfix = '_watts'
      when /\A([^\[]+)\[(MHz)\]\z/
        multiplicator = 1_000_000
        unit = $2
        name_postfix = '_hz'
      when /\A([^\[\]]+)\z/
        multiplicator = 1
        unit = ''
        name_postfix = ''
      else
        raise("Unknown what to do with string `#{column}'")
      end
      name = $1.strip.downcase.gsub('.', '_')
      if column.include?('temperature') && name_postfix.blank?
        name_postfix = '_celsius'
      end

      line_arrs.each do |line_arr|
        field_str = line_arr[index]
        field_value =
          begin
            Integer(field_str.sub(unit, '').strip)
          rescue ArgumentError
            Float(field_str.sub(unit, '').strip)
          end
        field_value *= multiplicator

        uuid = line_arr[0].sub(/\AGPU-/, '')
        result[uuid] ||= {}
        result[uuid]["#{name}#{name_postfix}"] = field_value
      end
    end
    result
  end

  def format_prometheus(data_hash)
    output_list = []
    data_hash.each do |uuid, options|
      options.each do |name, value|
        output_list << "#{@name_prefix}#{name}{uuid=\"#{uuid}\"} #{value}"
      end
    end
    output_list.join("\n") + "\n"
  end
end
