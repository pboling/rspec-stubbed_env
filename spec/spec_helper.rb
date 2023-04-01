# frozen_string_literal: true

require "support/fake_rails"
require "support/foo_by_env"

# If not on CI, or if coverage is turned on
require "simplecov" if ENV["CI"].nil? || ENV["COVERAGE"] == "true"

require "rspec/stubbed_env"
require "rspec/block_is_expected"
require "rspec/block_is_expected/matchers/not"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with(:rspec) do |c|
    c.syntax = :expect
  end
end
