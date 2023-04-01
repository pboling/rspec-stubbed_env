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
  eval_gemfile "./gemfiles/contexts/coverage.gemfile"

  # Linting
  eval_gemfile "./gemfiles/contexts/style.gemfile"

  # Testing
  eval_gemfile "./gemfiles/contexts/testing.gemfile"

  # Documentation
  eval_gemfile "./gemfiles/contexts/docs.gemfile"
end

eval_gemfile "./gemfiles/contexts/core.gemfile"
