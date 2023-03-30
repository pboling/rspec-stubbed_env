# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rubocop/gradual/rake_task'

RuboCop::Gradual::RakeTask.new

task default: %i[spec rubocop_gradual]
