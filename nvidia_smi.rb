require 'open3'
require 'active_support/core_ext/object/blank'

class NvidiaSMI
  attr_reader :binary_path

  def initialize(binary_path: nil)
    if binary_path.present?
      @binary_path = binary_path
    else
      stdout_str, status = Open3.capture2('which nvidia-smi')
      @binary_path = stdout_str.strip if status.exitstatus.zero?
    end
  end

  def query_gpu(list = [])
    fail('nvidia-smi binary not defined') unless @binary_path.present?

    list = ['uuid'] + (list - ['uuid'])
    stdout_str, status = Open3.capture2(
      @binary_path,
      '--format=csv',
      "--query-gpu=#{list.join(',')}")
  end

  def parser(str)
    lines = str.strip.split("\n")
    arrs = lines.inject([]) { |arr, line| arr << line.split(',').map(&:strip) }

    headers, *line_arrs = arrs
    fail('Header presents only') if line_arrs.blank?

    result = {}
    headers.each_with_index do |column, index|
      fail('First column is not uuid') if index.zero? && column != 'uuid'
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
        fail("Unknown what to do with for string `#{column}'")
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
end
