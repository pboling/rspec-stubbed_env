# frozen_string_literal: true

RSpec.describe(RSpec::StubbedEnv) do
  it "has a (deprecated) version number" do
    expect(RSpec::StubbedEnv::VERSION).not_to(be_nil)
  end

  it "has a version number" do
    expect(RSpec::StubbedEnv::Version::VERSION).not_to(be_nil)
  end
end
