# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in rspec-stubbed_env.gemspec
gemspec

RUBY_VER = Gem::Version.new(RUBY_VERSION)
IS_CI = !ENV["CI"].nil?
LOCAL_SUPPORTED = !IS_CI && Gem::Version.new("2.7") <= RUBY_VER && RUBY_ENGINE == "ruby"

if LOCAL_SUPPORTED
  # Coverage
  gem "simplecov", "~> 0.22", :require => false
  gem "simplecov-cobertura", "~> 2.1", :require => false # XML for Jenkins
  gem "simplecov-json", "~> 0.2", :require => false # For CodeClimate
  gem "simplecov-lcov", "~> 0.8", :require => false
  # SimpleCov extension gems can be slow to update.
  # Avoid deprecations by using fixed forks.
  gem "simplecov-rcov", :github => "pboling/simplecov-rcov", :branch => "patch-1"

  # Linting
  gem "rubocop-gradual", "~> 0.3"
  gem "rubocop-lts", "~> 18.0" # Support Ruby 2.7+
  gem "rubocop-md", "~> 1.2"
  gem "rubocop-packaging", "~> 0.5"
  gem "rubocop-performance", "~> 1.16"
  gem "rubocop-rake", "~> 0.6"
  gem "rubocop-rspec", "~> 2.19"
  gem "rubocop-shopify", "~> 2.12"
  gem "rubocop-thread_safety", "~> 0.5"
  gem "standard", "~> 1.25"

  # Dev
  gem "rake", "~> 13.0"

  # Testing
  gem "rspec", "~> 3.8"
  gem "rspec-block_is_expected", "~> 1.0"
end
