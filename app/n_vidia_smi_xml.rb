require 'active_support/core_ext/object/blank'
require 'nokogiri'

class NVidiaSMI_XML
  attr_reader :binary_path, :name_prefix

  def initialize(binary_path:, name_prefix: nil)
    @binary_path = binary_path
    @name_prefix = name_prefix
  end

  def query
    unless @binary_path.present?
      raise("Don't know path to nvidia-smi binary")
    end

    stdout_and_stderr_str, status = Open3.capture2e(@binary_path, '--query', '--xml-format')

    unless status.exitstatus.zero?
      raise(stdout_and_stderr_str)
    end

    stdout_and_stderr_str
  end

  def parse(str)
    doc = Nokogiri::XML(str)
    output = {}

    if (nodes = doc.xpath('/nvidia_smi_log/driver_version/text()')).size == 1
      output['driver_version'] = { {} => nodes[0].content.strip }
    end

    if (nodes = doc.xpath('/nvidia_smi_log/cuda_version/text()')).size == 1
      output['cuda_version'] = { {} => nodes[0].content.strip }
    end

    if (nodes = doc.xpath('/nvidia_smi_log/attached_gpus/text()')).size == 1
      output['attached_gpus'] = { {} => nodes[0].content.strip }
    end

    # traverse every node in every gpu branch
    doc.xpath('/nvidia_smi_log/gpu').each do |node|
      pci_bus_id = node.get_attribute('id')
      root_path = "#{node.path}/"
      uuid = node.xpath('./uuid')[0]&.content
      if uuid =~ /^GPU-/
        uuid = uuid.slice(4..-1)
      end

      node.traverse do |sub_node|
        # skip not leaf
        if sub_node.element? && sub_node.children.size == 1 && (text_el = sub_node.children[0]).text? &&
          # skip N/A мфдгу
          (data = text_el.content.strip) != 'N/A' &&
          # skip empty value
          data != ''

          # cut common path /nvidia_smi_log/gpu[x]
          local_path = sub_node.path
          if local_path.slice(0, root_path.size) == root_path
            local_path = local_path.slice(root_path.size..-1)
          end

          # TODO don't skip paths within array like a
          # /nvidia_smi_log/gpu[2]/processes/process_info[1]/pid <= 450
          # /nvidia_smi_log/gpu[2]/processes/process_info[1]/type <= G
          # /nvidia_smi_log/gpu[2]/processes/process_info[1]/process_name <= /usr/lib/xorg/Xorg
          # /nvidia_smi_log/gpu[2]/processes/process_info[1]/used_memory <= 5 MiB
          if local_path !~ /\[\d+\]/
            local_path, data = normalize_data(local_path, data)
            output[local_path] ||= {}
            output[local_path][{ uuid: uuid }] = data
          end
        end
      end
    end
    output
  end

  def format_prometheus(hash)
    output_list = []
    hash.each do |path, values|
      values.each do |labels_hash, value|
        name = path.gsub('/', '_')
        labels = format_labels(labels_hash)
        output_list << "#{@name_prefix}#{name}#{labels} #{value}"
      end
    end
    output_list.join("\n") + "\n"
  end

  private

  def normalize_data(path, data)
    num = '\d+(?:\.\d+)?'

    case data

    when /^(#{num})\sB$/
      return ["#{path}_bytes", ($1.to_f).to_i]
    when /^(#{num})\sKiB$/
      return ["#{path}_bytes", ($1.to_f * 1024).to_i]
    when /^(#{num})\sMiB$/
      return ["#{path}_bytes", ($1.to_f * 1024 * 1024).to_i]
    when /^(#{num})\sGiB$/
      return ["#{path}_bytes", ($1.to_f * 1024 * 1024 * 1024).to_i]

    when /^(#{num})\sHz$/
      return ["#{path}_hz", $1.to_f]
    when /^(#{num})\sKHz$/
      return ["#{path}_hz", $1.to_f * 1000]
    when /^(#{num})\sMHz$/
      return ["#{path}_hz", $1.to_f * 1000 * 1000]
    when /^(#{num})\sGHz$/
      return ["#{path}_hz", $1.to_f * 1000 * 1000 * 1000]

    when /^(#{num})\s%$/
      return ["#{path}_ratio", $1.to_f / 100.0]

    when /^(#{num})\sC$/
      return ["#{path}_celsius", $1.to_f]

    when /^(#{num})\sW$/
      return ["#{path}_watts", $1.to_f]
    when /^(#{num})\sKW$/
      return ["#{path}_watts", $1.to_f * 1000.0]

    when /^(#{num})\sB\/s$/
      return ["#{path}_bytes_per_second", ($1.to_f).to_i]
    when /^(#{num})\sKB\/s$/
      return ["#{path}_bytes_per_second", ($1.to_f * 1024).to_i]
    when /^(#{num})\sMB\/s$/
      return ["#{path}_bytes_per_second", ($1.to_f * 1024 * 1024).to_i]
    when /^(#{num})\sGB\/s$/
      return ["#{path}_bytes_per_second", ($1.to_f * 1024 * 1024 * 1024).to_i]

    else
      return [path, data]
    end
  end

  def format_labels(hash)
    list = hash.map do |k, v|
      "#{k}=\"#{v}\""
    end
    list == [] ? '' : "{#{list.join(',')}}"
  end
end
