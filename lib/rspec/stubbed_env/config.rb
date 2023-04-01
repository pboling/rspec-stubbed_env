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

RSpec.shared_context("with stubbed env") do
  include RSpec::StubbedEnv::TestHelpers
end
