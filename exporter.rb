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

    data_str = nvidia_smi.query
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
