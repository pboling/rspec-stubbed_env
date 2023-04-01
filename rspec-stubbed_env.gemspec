# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rspec/stubbed_env/version"

Gem::Specification.new do |spec|
  spec.name = "rspec-stubbed_env"
  spec.version = RSpec::StubbedEnv::VERSION
  spec.authors = ["Liam Bennett", "Peter Boling"]
  spec.email = ["peter.boling@gmail.com"]

  # See CONTRIBUTING.md
  spec.cert_chain  = ["certs/pboling.pem"]
  spec.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $PROGRAM_NAME.end_with?("gem")

  spec.summary = "Unobtrusively stub ENV keys and values during testing"
  spec.description = %[Stub environment variables in a scoped context for testing
stub_env(
  'AWS_REGION' => 'us-east-1',
  'REDIS_URL' => 'redis://localhost:6379/'
)]
  spec.homepage = "https://github.com/pboling/rspec-stubbed_env"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 1.8.7"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "#{spec.homepage}/tree/v#{spec.version}"
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/v#{spec.version}/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "#{spec.homepage}/issues"
  spec.metadata["documentation_uri"] = "https://www.rubydoc.info/gems/#{spec.name}/#{spec.version}"
  spec.metadata["funding_uri"] = "https://liberapay.com/pboling"
  spec.metadata["wiki_uri"] = "#{spec.homepage}/wiki"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir[
    # Splats (alphabetical)
    "lib/**/*.rb",
    # Files (alphabetical)
    "CHANGELOG.md",
    "CODE_OF_CONDUCT.md",
    "LICENSE.txt",
    "README.md"
  ]
  spec.bindir = "exe"
  spec.require_paths = ["lib"]
end
