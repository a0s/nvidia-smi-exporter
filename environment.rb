require 'awesome_print'
require 'sinatra'
require_relative 'nvidia_smi'
require_relative 'exporter'

# ENV['NVIDIA_SMI_EXPORTER_BINARY']
# ENV['NVIDIA_SMI_EXPORTER_QUERY']
# ENV['NVIDIA_SMI_EXPORTER_PORT']
# ENV['NVIDIA_SMI_EXPORTER_HOST']
# ENV['NVIDIA_SMI_EXPORTER_NAME_PREFIX']

ENV['NVIDIA_SMI_EXPORTER_NAME_PREFIX'] ||= 'nvidia_smi_'
