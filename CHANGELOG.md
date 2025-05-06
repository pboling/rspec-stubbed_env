# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog v1](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning v2](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
### Changed
### Fixed
### Removed

## [1.0.2] - 2025-05-06 ([tag][1.0.2t])
- COVERAGE: 100.00% -- 70/70 lines in 4 files
- BRANCH COVERAGE: 100.00% -- 10/10 branches in 4 files
- 85.71% documented
### Added
- `hide_env`
  - `include_context "with hidden env", "FOO"`
- Allow providing the env key/value pairs to be stubbed to `include_context` (@darhazer)
  - `include_context "with stubbed env", "FOO" => "is bar"`
- Security policy (SECURITY.md)
- Random ordering of test suite
- 20 year signing cert expires 2045-04-29
- dev container config for development
- Added appraisals to test on many supported Rubies
  - Ruby 2.3+, including head
  - JRuby 9.1+, including head
  - Truffleruby 22.3+, including head
- Added CITATION.cff
- Upgraded Code of Conduct based on Contributor Covenant v2.1
- New pattern for loading version.rb in gemspec allows (real) 100% code coverage

## [1.0.1] - 2023-04-01 ([tag][1.0.1t])
### Added
- support for values_at (@darhazer)
- support for symbol keys (@hosamaly)
- Structured gemfiles
- Rubocop with standard, gradual, & more
- Releases are now signed
- Releases now have checksums
### Changed
- Required ruby version in gemspec >= 1.8.7
  - not bumping major version, because this was already the de-facto minimum
- TravisCI => GitHub Actions
- CODE_OF_CONDUCT.md upgraded to v2.0
- Moved from master to main default branch
### Fixed
- README Badges (CI status)

## [1.0.0] - 2018-10-06 ([tag][1.0.0t])
### Added
- negated matchers
- rubocop config

<!-- Contributors (alphabetically) -->
[@darhazer]: https://github.com/darhazer
[@hosamaly]: https://github.com/hosamaly

[Unreleased]: https://gitlab.com/pboling/rspec-stubbed_env/-/compare/v1.0.2...main
[1.0.2]: https://gitlab.com/pboling/rspec-stubbed_env/-/compare/v1.0.1...v1.0.2
[1.0.2t]: https://gitlab.com/pboling/rspec-stubbed_env/-/tags/v1.0.2
[1.0.1]: https://gitlab.com/pboling/rspec-stubbed_env/-/compare/v1.0.0...v1.0.1
[1.0.1t]: https://gitlab.com/pboling/rspec-stubbed_env/-/tags/v1.0.1
[1.0.0]: https://gitlab.com/pboling/rspec-stubbed_env/-/compare/a3055964517c159bf214712940982034b75264be...v1.0.0
[1.0.0t]: https://gitlab.com/pboling/rspec-stubbed_env/-/tags/v1.0.0
