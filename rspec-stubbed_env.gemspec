# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/stubbed_env/version'

Gem::Specification.new do |spec|
  spec.name          = 'rspec-stubbed_env'
  spec.version       = RSpec::StubbedEnv::VERSION
  spec.authors       = ['Peter Boling']
  spec.email         = ['peter.boling@gmail.com']

  spec.summary       = 'Unobtrusively stub ENV keys and values during testing'
  spec.description   = %[Stub environment variables in a scoped context for testing
stub_env(
  'AWS_REGION' => 'us-east-1',
  'REDIS_URL' => 'redis://localhost:6379/'
)]
  spec.homepage      = 'https://github.com/pboling/rspec-stubbed_env'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = "#{spec.homepage}/tree/v#{spec.version}"
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/v#{spec.version}/CHANGELOG.md"
  spec.metadata['bug_tracker_uri'] = "#{spec.homepage}/issues"
  spec.metadata['documentation_uri'] = "https://www.rubydoc.info/gems/#{spec.name}/#{spec.version}"
  spec.metadata['funding_uri'] = 'https://liberapay.com/pboling'
  spec.metadata['wiki_uri'] = "#{spec.homepage}/wiki"
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files         = Dir['lib/**/*', 'LICENSE', 'README.md']
  spec.bindir        = 'exe'
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rspec', '>= 3.0'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop-packaging', '~> 0.1'
  spec.add_development_dependency 'simplecov', '~> 0.16'
end
