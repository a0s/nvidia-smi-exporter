require_relative 'spec_helper'

describe NvidiaSMI do
  describe '#parser' do
    it { expect(subject.parse(fixture_load('stdout1.txt'))).to eq(JSON.load(fixture_load('result1.json'))) }
    it { expect(subject.parse(fixture_load('stdout2.txt'))).to eq(JSON.load(fixture_load('result2.json'))) }
  end
end
