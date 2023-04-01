## Contributing

Bug reports and pull requests are welcome on GitLab at [https://gitlab.com/pboling/rspec-stubbed_env][🚎src-main]
. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to
the [code of conduct][conduct].

To submit a patch, please fork the project and create a patch with tests. Once you're happy with it send a pull request
and post a message to the [gitter chat][🏘chat].

## Release

To release a new version:

1. Run `bin/setup && bin/rake` as a tests, coverage, & linting sanity check.
2. update the version number in `version.rb`
3. run `bundle exec rake build:checksum`
4. move the built gem to project root
5. run `bin/checksum` to create the missing SHA256 checksum
6. move the built gem back to `pkg/`
7. commit the changes
8. run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org][rubygems].

NOTE: You will need to have a public key in `certs/`, and list your cert in the
`gemspec`, in order to sign the new release.
See: [RubyGems Security Guide][rubygems-security-guide]

## Contributors

See: [https://gitlab.com/pboling/rspec-stubbed_env/-/graphs/main][🖐contributors]

[conduct]: https://gitlab.com/pboling/rspec-stubbed_env/-/blob/main/CODE_OF_CONDUCT.md
[🖐contributors]: https://gitlab.com/pboling/rspec-stubbed_env/-/graphs/main
[🚎src-main]: https://gitlab.com/pboling/rspec-stubbed_env/-/tree/main
[🏘chat]: https://matrix.to/#/%23pboling_rspec-stubbed_env:gitter.im
[rubygems-security-guide]: https://guides.rubygems.org/security/#building-gems
[rubygems]: https://rubygems.org
