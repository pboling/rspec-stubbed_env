# frozen_string_literal: true

require "bundler/gem_tasks"

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  # puts "failed to load wwtd or rspec, probably because bundled --without-development"
  task(:spec) do
    warn("rspec is disabled")
  end
end
desc "Alias test to spec"
task :test => :spec

begin
  require "rubocop/gradual/rake_task"

  RuboCop::Gradual::RakeTask.new
rescue LoadError
  task(:rubocop_gradual) do
    warn("RuboCop (Gradual) is disabled")
  end
end

task :default => %i[spec rubocop_gradual]
