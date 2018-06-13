require_relative 'spec_helper'

describe NvidiaSMI do
  describe '#parser' do
    it 'should parse' do
      expect(subject.parser(fixture_load('stdout1.txt'))).
        to eq(
             'd86c351b-8f94-33ab-3b97-accb421fef6d' => {
               'memory_used_bytes' => 790626304,
               'utilization_gpu' => 1.0,
               'temperature_gpu_celsius' => 71,
               'power_draw_watts' => 217.24,
               'clocks_current_sm_hz' => 1949000000
             },
             '683c6e09-3969-31a5-b7ca-cc88252b7fce' => {
               'memory_used_bytes' => 672137216,
               'utilization_gpu' => 1.0,
               'temperature_gpu_celsius' => 71,
               'power_draw_watts' => 208.30,
               'clocks_current_sm_hz' => 2025000000
             })
    end

    it 'should parse' do
      expect(subject.parser(fixture_load('stdout2.txt'))).
        to eq(
             '20fe89bc-c8ef-5a9f-078e-efa3324d790b' => {
               'fan_speed' => 0.63,
               'temperature_gpu_celsius' => 73,
               'power_draw_watts' => 213.07,
               'power_limit_watts' => 216.0,
               'utilization_gpu' => 1.0,
               'utilization_memory' => 0.87,
               'memory_used_bytes' => 790626304,
               'memory_total_bytes' => 8513388544,
               'clocks_current_graphics_hz' => 1987000000,
               'clocks_max_graphics_hz' => 1999000000,
               'clocks_current_sm_hz' => 1987000000,
               'clocks_current_memory_hz' => 5130000000,
               'clocks_max_memory_hz' => 5005000000
             },
             '68988cf6-8de9-6585-a263-d2e3ea96b75a' => {
               'fan_speed' => 0.81,
               'temperature_gpu_celsius' => 67,
               'power_draw_watts' => 187.04,
               'power_limit_watts' => 216.0,
               'utilization_gpu' => 1.0,
               'utilization_memory' => 0.9,
               'memory_used_bytes' => 614465536,
               'memory_total_bytes' => 4239392768,
               'clocks_current_graphics_hz' => 1453000000,
               'clocks_max_graphics_hz' => 1606000000,
               'clocks_current_sm_hz' => 1453000000,
               'clocks_current_memory_hz' => 3004000000,
               'clocks_max_memory_hz' => 3505000000
             },
             '90e3dab0-b59d-8bf6-d909-d4fab8d2f29b' => {
               'fan_speed' => 0.55,
               'temperature_gpu_celsius' => 68,
               'power_draw_watts' => 206.44,
               'power_limit_watts' => 216.0,
               'utilization_gpu' => 1.0,
               'utilization_memory' => 0.87,
               'memory_used_bytes' => 672137216,
               'memory_total_bytes' => 8513388544,
               'clocks_current_graphics_hz' => 1949000000,
               'clocks_max_graphics_hz' => 1936000000,
               'clocks_current_sm_hz' => 1949000000,
               'clocks_current_memory_hz' => 5130000000,
               'clocks_max_memory_hz' => 5005000000
             })
    end
  end
end
