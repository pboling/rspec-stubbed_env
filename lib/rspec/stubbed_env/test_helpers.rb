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
module RSpec
  module StubbedEnv
    # Helpers to unobtrusively stub ENV
    module TestHelpers
      # Can be called with all key value pairs to be stubbed as a hash:
      #
      #     stub_env('A' => 'B', 'C' => 'D', 'E' => 'F')
      #
      # Alternatively can be called one per ENV key-value pair to stub:
      #
      #     stub_env('A', 'B')
      #     stub_env('C', 'D')
      #     stub_env('E', 'F')
      def stub_env(key_or_hash, value = nil)
        init_stub unless env_stubbed?
        if key_or_hash.is_a? Hash
          key_or_hash.each { |k, v| add_stubbed_value(k, v) }
        else
          add_stubbed_value key_or_hash, value
        end
      end

      private

      STUBBED_KEY = '__STUBBED__'

      def add_stubbed_value(key, value)
        allow(ENV).to receive(:[]).with(key).and_return(value)
        allow(ENV).to receive(:fetch).with(key).and_return(value)
        allow(ENV).to receive(:fetch).with(key, anything) do |_, default_val|
          value || default_val
        end
      end

      def env_stubbed?
        ENV.fetch(STUBBED_KEY, nil)
      end

      def init_stub
        allow(ENV).to receive(:[]).and_call_original
        allow(ENV).to receive(:fetch).and_call_original
        add_stubbed_value(STUBBED_KEY, true)
      end
    end
  end
end
