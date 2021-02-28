RSpec.describe NVidiaSMI do
  subject { described_class.new(binary_path: nil, query_list: nil, name_prefix: nil) }

  describe '#parser' do
    it { expect(subject.parse(fixture_load('nvidia-smi-1.csv'))).to eq(JSON.load(fixture_load('parsed-1.json'))) }
    it { expect(subject.parse(fixture_load('nvidia-smi-2.csv'))).to eq(JSON.load(fixture_load('parsed-2.json'))) }
  end
end
