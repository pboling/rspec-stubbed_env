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
  eval_gemfile "./gemfiles/gems/coverage.gemfile"
  # gem "simplecov", "~> 0.22", :require => false
  # gem "simplecov-cobertura", "~> 2.1", :require => false # XML for Jenkins
  # gem "simplecov-json", "~> 0.2", :require => false # For CodeClimate
  # gem "simplecov-lcov", "~> 0.8", :require => false
  # # SimpleCov extension gems can be slow to update.
  # # Avoid deprecations by using fixed forks.
  # gem "simplecov-rcov", :github => "pboling/simplecov-rcov", :branch => "patch-1", :require => false

  # Linting
  eval_gemfile "./gemfiles/gems/style.gemfile"
  # gem "rubocop-gradual", "~> 0.3", :require => false
  # gem "rubocop-lts", "~> 18.0", :require => false # Support Ruby 2.7+
  # gem "rubocop-md", "~> 1.2", :require => false
  # gem "rubocop-packaging", "~> 0.5", :require => false
  # gem "rubocop-performance", "~> 1.16", :require => false
  # gem "rubocop-rake", "~> 0.6", :require => false
  # gem "rubocop-rspec", "~> 2.19", :require => false
  # gem "rubocop-shopify", "~> 2.12", :require => false
  # gem "rubocop-thread_safety", "~> 0.5", :require => false
  # gem "standard", "~> 1.25", :require => false
end

eval_gemfile "./gemfiles/gems/core.gemfile"
