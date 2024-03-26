# frozen_string_literal: true

#
# ENV stubbing is opt-in, via a shared context, rather than global
#
# Usage:
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
# Alternative usage:
#
# describe 'another stubbed test' do
#   include_context 'with stubbed env', 'FOO' => 'is_bar'
#   it 'also does a thing' do
#     expect(ENV['FOO']).to eq('is bar')
#   end
# end

RSpec.shared_context("with stubbed env") do |args|
  include RSpec::StubbedEnv::TestHelpers

  if args.is_a?(Hash) && args.any?
    before { stub_env(args) }
  end
end
