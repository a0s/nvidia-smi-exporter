require_relative 'environment'

class Exporter < Sinatra::Base
  set :traps, false
  set :server, :puma
  set :port, ENV['NVIDIA_SMI_EXPORTER_PORT']
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

    nvidia_smi = self.class.nvidia_smi
    if nvidia_smi.nil?
      fail('self.class.nvidia_smi not initialized')
    end

    query_list = ENV['NVIDIA_SMI_EXPORTER_QUERY'].to_s.split(',')
    if query_list.blank? || query_list == %w(uuid)
      halt 400, 'NVIDIA_SMI_EXPORTER_QUERY is empty'
    end

    data_str = nvidia_smi.query(query_list)
    if data_str.nil?
      halt 500, 'Something wrong'
    end

    data_hash = nvidia_smi.parse(data_str)
    format_prometheus(data_hash)
  end

  get '/ping' do
    halt 200, 'OK'
  end
end
