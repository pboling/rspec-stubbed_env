# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog v1](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning v2](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
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

### Changed
### Fixed
### Removed

## [1.0.1] - 2023-04-01
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

## [1.0.0] - 2018-10-06
### Added
- negated matchers
- rubocop config

<!-- Contributors (alphabetically) -->
[@darhazer]: https://github.com/darhazer
[@hosamaly]: https://github.com/hosamaly
