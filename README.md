# RSpec::StubbedEnv

ENV stubbing via a shared context for more powerful tests.  Now you don't need to add dotenv just for your spec suite.

```ruby
describe "my stubbed test" do
  include_context "with stubbed env"
  before do
    stub_env("FOO" => "is bar")
  end
  it "has a value" do
    expect(ENV.fetch("FOO", nil)).to(eq("is bar"))
  end
end
```

| Project                | RSpec::StubbedEnv                                                                                                                                                                    |
|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| gem name               | [rspec-stubbed_env](https://rubygems.org/gems/rspec-stubbed_env)                                                                                                                     |
| license                | [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)                                                                           |
| download rank          | [![Downloads Today](https://img.shields.io/gem/rd/rspec-stubbed_env.svg)](https://github.com/pboling/rspec-stubbed_env)                                                              |
| version                | [![Version](https://img.shields.io/gem/v/rspec-stubbed_env.svg)](https://rubygems.org/gems/rspec-stubbed_env)                                                                        |
| dependencies           | [![Depfu][depfu-img]][depfu]                                                                                                                                                         |
| continuous integration | [![Current][🚎cwfi]][🚎cwf] [![Heads][🖐hwfi]][🖐hwf] [![Style][🧮swfi]][🧮swf]                                                                                                      |
| test coverage          | [![Test Coverage][cc-covi]][cc-cov]                                                                                                                                                  |
| maintainability        | [![Maintainability](https://api.codeclimate.com/v1/badges/07a1d53634c61154efae/maintainability)](https://codeclimate.com/github/pboling/rspec-stubbed_env/maintainability)           |
| code triage            | [![Open Source Helpers](https://www.codetriage.com/pboling/rspec-stubbed_env/badges/users.svg)](https://www.codetriage.com/pboling/rspec-stubbed_env)                                |
| homepage               | [on Github.com][homepage], [on Railsbling.com][blogpage]                                                                                                                             |
| documentation          | [on RDoc.info][documentation]                                                                                                                                                        |
| Spread ~♡ⓛⓞⓥⓔ♡~        | [![Liberapay Goal Progress][⛳liberapay-img]][⛳liberapay], [🧊][🧊berg], [🛖][🛖hut], [🧪][🧪lab], [🌏][aboutme], [👼][angellist], [⚗️][devto], [![Tweet @galtzo][followme]][twitter] |

[🚎cwf]: https://github.com/pboling/rspec-stubbed_env/actions/workflows/current.yml
[🚎cwfi]: https://github.com/pboling/rspec-stubbed_env/actions/workflows/current.yml/badge.svg
[🖐hwf]: https://github.com/pboling/rspec-stubbed_env/actions/workflows/heads.yml
[🖐hwfi]: https://github.com/pboling/rspec-stubbed_env/actions/workflows/heads.yml/badge.svg
[🧮swf]: https://github.com/pboling/rspec-stubbed_env/actions/workflows/style.yml
[🧮swfi]: https://github.com/pboling/rspec-stubbed_env/actions/workflows/style.yml/badge.svg

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rspec-stubbed_env", :group => :test
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-stubbed_env


You must configure RSpec to use the `:expect` syntax, or some compatible alternative.

```ruby
RSpec.configure do |config|
  config.expect_with(:rspec) do |c|
    c.syntax = :expect
  end
end
```

Require the library in your spec/test helper somewhere:
```
require "rspec/stubbed_env"
```

## Usage

ENV stubbing:

  - is opt-in, via a shared context, rather than global.
  - *does not* affect the real ENV at all.  It is a true stub.
  - has the same scope as a `before`, `subject`, or `let` at the same level.

See the spec suite for detailed examples.

```ruby
# This is normal, without stubbing, ENV is not set
describe "vanilla" do
  it "has no ENV stub" do
    expect(ENV.fetch("FOO", nil)).to(be_nil)
  end
end

# With a stubbed ENV!
describe "my stubbed test" do
  include_context "with stubbed env"
  before do
    stub_env("FOO" => "is bar")
  end
  it "has a value" do
    expect(ENV.fetch("FOO", nil)).to(eq("is bar"))
  end
end
```

## Switcch to `main` branch

We recently migrated from `master` to `main` as the default branch.  If this affected your local checkout:
```shell
git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

### 🚀 Release Instructions

See [CONTRIBUTING.md][contributing].

## Authors

* [Liam Bennet](https://github.com/ljkbennett) of LittleOwlLabs was the original author.
* [Peter H. Boling][peterboling] of [Rails Bling][railsbling] is has been maintaining since 2018.

## Contributing

See [CONTRIBUTING.md][contributing].
[contributing]: https://gitlab.com/pboling/rspec-stubbed_env/-/blob/main/CONTRIBUTING.md

## Code of Conduct

Everyone interacting in the AnonymousActiveRecord project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct][conduct].

## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0][semver].
Violations of this scheme should be reported as bugs. Specifically,
if a minor or patch version is released that breaks backward
compatibility, a new version should be immediately released that
restores compatibility. Breaking changes to the public API will
only be introduced with new major versions.

As a result of this policy, you can (and should) specify a
dependency on this gem using the [Pessimistic Version Constraint][pvc] with two digits of precision.

For example in a `Gemfile`:

    gem 'rspec-stubbed_env', '~> 1.0', group: [:development, :test]

or in a `gemspec`

    spec.add_development_dependency 'rspec-stubbed_env', '~> 1.0'

## License

* Copyright © 2014 LittlOwlLabs [Liam Bennet](https://github.com/ljkbennett)
* Copyright © 2018-2020, 2023 [Peter H. Boling][peterboling] of [Rails Bling][railsbling]

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

[aboutme]: https://about.me/peter.boling
[angellist]: https://angel.co/peter-boling
[blogpage]: http://www.railsbling.com/tags/rspec-stubbed_env/
[cc-cov]: https://codeclimate.com/github/pboling/rspec-stubbed_env/test_coverage
[cc-covi]: https://api.codeclimate.com/v1/badges/07a1d53634c61154efae/test_coverage
[conduct]: CODE_OF_CONDUCT.md
[contributing]: CONTRIBUTING.md
[depfu]: https://depfu.com/github/pboling/rspec-stubbed_env?project_id=5884
[depfu-img]: https://badges.depfu.com/badges/a48948dd503f23a440f2c17910563f43/count.svg
[devto]: https://dev.to/galtzo
[documentation]: http://rdoc.info/github/pboling/rspec-stubbed_env/frames
[followme]: https://img.shields.io/twitter/follow/galtzo.svg?style=social&label=Follow
[homepage]: https://github.com/pboling/rspec-stubbed_env/
[license]: LICENSE.txt
[peterboling]: http://www.peterboling.com
[pvc]: http://guides.rubygems.org/patterns/#pessimistic-version-constraint
[railsbling]: http://www.railsbling.com
[semver]: http://semver.org/
[twitter]: http://twitter.com/galtzo
[🧊berg]: https://codeberg.org/pboling
[🛖hut]: https://sr.ht/~galtzo/
[🧪lab]: https://gitlab.com/pboling
[⛳liberapay]: https://liberapay.com/pboling/donate
[⛳liberapay-img]: https://img.shields.io/liberapay/goal/pboling.svg?logo=liberapay
