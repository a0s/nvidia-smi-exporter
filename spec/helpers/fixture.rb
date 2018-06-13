module Fixture
  def fixture_load(name)
    file_name = File.expand_path("../../fixtures/#{name}", __FILE__)
    File.read(file_name)
  end
end
