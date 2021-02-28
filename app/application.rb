require 'open3'
require_relative 'n_vidia_smi'
require_relative 'exporter'

class Application
  def initialize
    Thread.abort_on_exception = true

    ENV['NVIDIA_SMI_EXPORTER_MODE'] ||= 'xml'
    ENV['NVIDIA_SMI_EXPORTER_PORT'] ||= '9454'
    ENV['NVIDIA_SMI_EXPORTER_HOST'] ||= '0.0.0.0'
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
      memory.total
      memory.used
      power.draw
      power.limit
      temperature.gpu
      utilization.gpu
      utilization.memory
    ).join(',')

    ENV['NVIDIA_SMI_EXPORTER_BINARY'] ||= begin
      stdout_str, status = Open3.capture2('which nvidia-smi')
      status.exitstatus.zero? ? stdout_str.strip : nil
    end
  end

  def run!
    Exporter.run!
  end
end

Application.new.run!
