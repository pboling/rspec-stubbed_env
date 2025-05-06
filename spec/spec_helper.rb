# frozen_string_literal: true

# External gems
require "rspec/block_is_expected"
require "rspec/block_is_expected/matchers/not"

# Helpers
# We can use require_relative here because we are only running specs against Ruby 2.3+
# The runtime gem still supports Ruby 1..8.7+, so we can't use it there.
require_relative "support/fake_rails"
require_relative "support/foo_by_env"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with(:rspec) do |c|
    c.syntax = :expect
  end
end

# NOTE: Gemfiles for older rubies won't have kettle-soup-cover.
#       The rescue LoadError handles that scenario.
begin
  require "kettle-soup-cover"
  require "simplecov" if Kettle::Soup::Cover::DO_COV # `.simplecov` is run here!
rescue LoadError => error
  # check the error message, if you are so inclined, and re-raise if not what is expected
  raise error unless error.message.include?("kettle")
end

# This gem
require "rspec/stubbed_env"
