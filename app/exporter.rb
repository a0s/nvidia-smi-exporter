require 'sinatra/base'
require_relative 'n_vidia_smi'
require_relative 'n_vidia_smi_xml'

class Exporter < Sinatra::Base
  set :traps, false
  set :server, :puma
  set :port, proc { ENV['NVIDIA_SMI_EXPORTER_PORT'].to_i }
  set :bind, proc { ENV['NVIDIA_SMI_EXPORTER_HOST'] }
  set :show_exceptions, false

  not_found do
    halt 404
  end

  error do
    halt 500
  end

  get '/metrics' do
    content_type 'text/plain'

    processor =
      case ENV['NVIDIA_SMI_EXPORTER_SOURCE']
      when 'csv'
        NVidiaSMI.new(
          binary_path: ENV['NVIDIA_SMI_EXPORTER_BINARY'],
          name_prefix: ENV['NVIDIA_SMI_EXPORTER_NAME_PREFIX'],
          query_list: ENV['NVIDIA_SMI_EXPORTER_QUERY'].to_s.split(','))
      when 'xml'
        NVidiaSMI_XML.new(
          binary_path: ENV['NVIDIA_SMI_EXPORTER_BINARY'],
          name_prefix: ENV['NVIDIA_SMI_EXPORTER_NAME_PREFIX'])
      else
        raise("Unknown value `#{ENV['NVIDIA_SMI_EXPORTER_SOURCE']}' in NVIDIA_SMI_EXPORTER_SOURCE")
      end

    response = processor.query
    data = processor.parse(response)
    processor.format_prometheus(data)
  end

  get '/ping' do
    halt 200, 'OK'
  end
end
