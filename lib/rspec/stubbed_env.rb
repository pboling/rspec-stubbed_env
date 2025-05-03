# frozen_string_literal: true

# This Gem
require "rspec/stubbed_env/version"
require "rspec/stubbed_env/hide_helpers"
require "rspec/stubbed_env/stub_helpers"
require "rspec/stubbed_env/config"

#
# ENV stubbing is opt-in, via a shared context, rather than global
#
# describe 'my stubbed test' do
#   include_context 'with stubbed env'
#   before do
#     stub_env('FOO' => 'is bar')
#   end
#   it 'does a thing' do
#     expect(ENV['FOO']).to eq('is bar')
#   end
# end
#
# describe 'my hidden test' do
#   include_context 'with hidden env'
#   before do
#     hide_env('FOO')
#   end
#   it 'does a thing' do
#     expect(ENV['FOO']).to be_nil
#   end
# end
module RSpec
  # Gem Namespace
  module StubbedEnv
  end
end
