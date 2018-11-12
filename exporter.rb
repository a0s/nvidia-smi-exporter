require 'sinatra'

class Exporter < Sinatra::Base
  set :traps, false
  set :server, :puma
  set :port, ENV['NVIDIA_SMI_EXPORTER_PORT'].to_i
  set :bind, ENV['NVIDIA_SMI_EXPORTER_HOST']
  set :show_exceptions, false

  not_found do
    halt 404
  end

  error do
    halt 500
  end

  get '/metrics' do
    content_type 'text/plain'

    nvidia_smi = NvidiaSMI.new(
      binary_path: ENV['NVIDIA_SMI_EXPORTER_BINARY'],
      name_prefix: ENV['NVIDIA_SMI_EXPORTER_NAME_PREFIX'],
      query_list: ENV['NVIDIA_SMI_EXPORTER_QUERY'].to_s.split(','))

    data_str = nvidia_smi.query
    halt(500, 'Something wrong') if data_str.nil?
    data_hash = nvidia_smi.parse(data_str)
    nvidia_smi.format_prometheus(data_hash)
  end

  get '/ping' do
    halt 200, 'OK'
  end
end
