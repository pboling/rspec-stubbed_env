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
  include RSpec::StubbedEnv::StubHelpers

  # TODO: Switch `length > 0` => `any?` after Ruby 1.8 support is dropped
  if args.is_a?(Hash) && args.keys.length > 0
    before { stub_env(args) }
  end
end

#
# ENV hiding is opt-in, via a shared context, rather than global
#
# Usage:
#
# describe 'my hidden test' do
#   include_context 'with hidden env'
#   before do
#     hide_env('FOO', 'BAR')
#   end
#   it 'does a thing' do
#     expect(ENV['FOO']).to be_nil
#   end
# end
#
# Alternative usage:
#
# describe 'another stubbed test' do
#   include_context 'with stubbed env', 'FOO', 'BAR'
#   it 'also does a thing' do
#     expect(ENV['BAR']).to be_nil
#   end
# end
RSpec.shared_context("with hidden env") do |*args|
  include RSpec::StubbedEnv::HideHelpers

  # TODO: Switch `length > 0` => `any?` after Ruby 1.8 support is dropped
  if args.is_a?(Array) && args.length > 0
    before { hide_env(*args) }
  end
end
