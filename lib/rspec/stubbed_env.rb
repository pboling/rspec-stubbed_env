# frozen_string_literal: true

require "rspec/stubbed_env/version"

# This Gem
require "rspec/stubbed_env/test_helpers"
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
module RSpec
  # Gem Namespace
  module StubbedEnv
  end
end
