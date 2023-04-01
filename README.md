# RSpec::StubbedEnv

ENV stubbing via a shared context for more powerful tests.  Now you don't need to add dotenv just for your spec suite.

```ruby
describe 'my stubbed test' do
  include_context 'with stubbed env'
  before do
    stub_env('FOO' => 'is bar')
  end
  it 'has a value' do
    expect(ENV.fetch('FOO', nil)).to eq('is bar')
  end
end
```

| Project                 | RSpec::StubbedEnv                                                                                                                                                                                                                           |
|------------------------ |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| gem name                | [rspec-stubbed_env](https://rubygems.org/gems/rspec-stubbed_env)                                                                                                                                                                            |
| license                 | [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)                                                                                                                                  |
| download rank           | [![Downloads Today](https://img.shields.io/gem/rd/rspec-stubbed_env.svg)](https://github.com/pboling/rspec-stubbed_env)                                                                                                                     |
| version                 | [![Version](https://img.shields.io/gem/v/rspec-stubbed_env.svg)](https://rubygems.org/gems/rspec-stubbed_env)                                                                                                                               |
| continuous integration  | [![Build Status](https://travis-ci.org/pboling/rspec-stubbed_env.svg?branch=main)](https://travis-ci.org/pboling/rspec-stubbed_env)                                                                                                         |
| test coverage           | [![Test Coverage](https://api.codeclimate.com/v1/badges/07a1d53634c61154efae/test_coverage)](https://codeclimate.com/github/pboling/rspec-stubbed_env/test_coverage)                                                                        |
| maintainability         | [![Maintainability](https://api.codeclimate.com/v1/badges/07a1d53634c61154efae/maintainability)](https://codeclimate.com/github/pboling/rspec-stubbed_env/maintainability)                                                                  |
| dependencies            | [![Depfu](https://badges.depfu.com/badges/a48948dd503f23a440f2c17910563f43/count.svg)](https://depfu.com/github/pboling/rspec-stubbed_env?project_id=5884)                                                                                  |
| code triage             | [![Open Source Helpers](https://www.codetriage.com/pboling/rspec-stubbed_env/badges/users.svg)](https://www.codetriage.com/pboling/rspec-stubbed_env)                                                                                       |
| homepage                | [on Github.com][homepage], [on Railsbling.com][blogpage]                                                                                                                                                                                    |
| documentation           | [on RDoc.info][documentation]                                                                                                                                                                                                               |
| Spread ~♡ⓛⓞⓥⓔ♡~      | [🌏](https://about.me/peter.boling), [👼](https://angel.co/peter-boling), [:shipit:](http://coderwall.com/pboling), [![Tweet Peter](https://img.shields.io/twitter/follow/galtzo.svg?style=social&label=Follow)](http://twitter.com/galtzo) |

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-stubbed_env', group: :test
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-stubbed_env


You must configure RSpec to use the `:expect` syntax, or some compatible alternative.

```ruby
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
```

Require the library in your spec/test helper somewhere:
```
require 'rspec/stubbed_env'
```

## Usage

ENV stubbing:

  - is opt-in, via a shared context, rather than global.
  - *does not* affect the real ENV at all.  It is a true stub.
  - has the same scope as a `before`, `subject`, or `let` at the same level.

See the spec suite for detailed examples.

```ruby
# This is normal, without stubbing, ENV is not set
describe 'vanilla' do
  it 'has no ENV stub' do
    expect(ENV.fetch('FOO', nil)).to be_nil
  end
end

# With a stubbed ENV!
describe 'my stubbed test' do
  include_context 'with stubbed env'
  before do
    stub_env('FOO' => 'is bar')
  end
  it 'has a value' do
    expect(ENV.fetch('FOO', nil)).to eq('is bar')
  end
end
```

## Upgrading

We recently migrated from `master` to `main` as the default branch.  If this affected your local checkout:
```shell
git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pboling/rspec-stubbed_env.

## Code of Conduct

Everyone interacting in the AnonymousActiveRecord project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/pboling/rspec-stubbed_env/blob/main/CODE_OF_CONDUCT.md).

## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0][semver].
Violations of this scheme should be reported as bugs. Specifically,
if a minor or patch version is released that breaks backward
compatibility, a new version should be immediately released that
restores compatibility. Breaking changes to the public API will
only be introduced with new major versions.

As a result of this policy, you can (and should) specify a
dependency on this gem using the [Pessimistic Version Constraint][pvc] with two digits of precision.

For example:

```ruby
spec.add_dependency 'rspec-stubbed_env', '~> 1.0'
```

## License

* Copyright © 2014 LittlOwlLabs [Liam Bennet](https://github.com/ljkbennett)
* Copyright © 2018-2020, 2023 [Peter H. Boling][peterboling] of [Rails Bling][railsbling]

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

[license]: LICENSE
[semver]: http://semver.org/
[pvc]: http://guides.rubygems.org/patterns/#pessimistic-version-constraint
[railsbling]: http://www.railsbling.com
[peterboling]: http://www.peterboling.com
[documentation]: http://rdoc.info/github/pboling/rspec-stubbed_env/frames
[homepage]: https://github.com/pboling/rspec-stubbed_env/
[blogpage]: http://www.railsbling.com/tags/rspec-stubbed_env/
