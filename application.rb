require_relative 'environment'

class Application
  def initialize
    Thread.abort_on_exception = true
  end

  def run!
    nvidia_smi = NvidiaSMI.new(
      binary_path: ENV['NVIDIA_SMI_EXPORTER_BINARY'],
      name_prefix: ENV['NVIDIA_SMI_EXPORTER_NAME_PREFIX'])
    Exporter.class_eval { set :nvidia_smi, nvidia_smi }
    Exporter.run!
  end
end

Application.new.run!
