require "kettle/soup/cover/config"

SimpleCov.start do
  # We can't get coverage of version.rb until we drop Ruby <= 2.1, and start using version_gem
  add_filter "lib/rspec/stubbed_env/version"
end
