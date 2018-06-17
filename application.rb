require_relative 'environment'

class Application
  def initialize
    Thread.abort_on_exception = true
  end

  def run!
    ENV['NVIDIA_SMI_EXPORTER_PORT'] ||= 9451
    ENV['NVIDIA_SMI_EXPORTER_NAME_PREFIX'] ||= 'nvidia_smi_'
    ENV['NVIDIA_SMI_EXPORTER_QUERY'] ||= %W(
      clocks.current.graphics
      clocks.current.memory
      clocks.current.sm
      clocks.current.video
      clocks.max.graphics
      clocks.max.memory
      clocks.max.sm
      fan.speed
      memory.free
      memory.total
      memory.used
      power.draw
      power.limit
      temperature.gpu
      utilization.gpu
      utilization.memory
    ).join(',')

    nvidia_smi = NvidiaSMI.new(
      binary_path: ENV['NVIDIA_SMI_EXPORTER_BINARY'],
      name_prefix: ENV['NVIDIA_SMI_EXPORTER_NAME_PREFIX'],
      query_list: ENV['NVIDIA_SMI_EXPORTER_QUERY'].to_s.split(','))

    Exporter.class_eval { set :nvidia_smi, nvidia_smi }
    Exporter.run!
  end
end

Application.new.run!
