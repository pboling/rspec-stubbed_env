# frozen_string_literal: true

RUBY_VER = Gem::Version.new(RUBY_VERSION)
RUN_MULTIPLE_FORMATTERS = (!ENV["CI"].nil? ||
  Gem::Version.new("2.7") <= RUBY_VER) && RUBY_ENGINE == "ruby"

SimpleCov.start do
  command_name "RSpec"

  enable_coverage :branch
  primary_coverage :branch

  # This would attempt to track version.rb,
  #   which is loaded when the gemspec is loaded,
  #   so coverage can't be tracked.
  # track_files "lib/**/*.rb"
  # Fortunately defaults work well.

  # Setup Coverage Dir
  coverage_dir "results/coverage"

  if RUN_MULTIPLE_FORMATTERS
    require "simplecov-cobertura"
    require "simplecov-json"
    require "simplecov-lcov"
    require "simplecov-rcov"

    SimpleCov::Formatter::LcovFormatter.config do |c|
      c.report_with_single_file = true
      c.single_report_path = "coverage/lcov.info"
    end

    SimpleCov.formatters = [
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::CoberturaFormatter, # XML for Jenkins
      SimpleCov::Formatter::RcovFormatter, # For Hudson
      SimpleCov::Formatter::LcovFormatter,
      SimpleCov::Formatter::JSONFormatter, # For CodeClimate
    ]
  else
    formatter SimpleCov::Formatter::HTMLFormatter
  end

  minimum_coverage(
    :branch => ENV.fetch("MIN_TEST_COVERAGE_BRANCH", 100).to_i,
    :line => ENV.fetch("MIN_TEST_COVERAGE_LINE", 100).to_i,
  )
end
