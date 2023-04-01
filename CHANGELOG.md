# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog v1](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning v2](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
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
