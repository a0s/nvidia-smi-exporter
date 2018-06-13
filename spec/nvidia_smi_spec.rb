require_relative 'spec_helper'

describe NvidiaSMI do
  describe '#parser' do
    it 'should parse' do
      expect(subject.parser(fixture_load('stdout1.txt'))).
        to eq({
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
                }
              })
    end
  end
end
