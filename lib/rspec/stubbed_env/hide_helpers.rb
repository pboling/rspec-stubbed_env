# frozen_string_literal: true

require "rspec/stubbed_env/stub_helpers"

#
# ENV hiding is opt-in, via a shared context, rather than global
#
# Usage:
#
# describe 'my hidden ENV test' do
#   include_context 'with hidden env'
#   before do
#     ENV["FOO"] = "is bar"
#     hide_env('FOO')
#   end
#   it 'is nil' do
#     expect(ENV['FOO']).to be_nil
#   end
#   it 'raises KeyError on fetch' do
#     expect { ENV.fetch('FOO') }.to raise_error(KeyError)
#   end
# end

module RSpec
  module StubbedEnv
    # Helpers to unobtrusively stub ENV
    module HideHelpers
      include StubHelpers

      # Can be called with an array of ENV keys to hide:
      #
      #     hide_env('FOO', 'BAR', 'BAZ') # Preferred
      #
      # Alternatively can be called once per ENV key to hide:
      #
      #     stub_env('A') # NOT
      #     stub_env('C') # AS
      #     stub_env('E') # GOOD (creates redundant stubs on values_at)
      def hide_env(*keys)
        init_stub unless env_stubbed?
        keys.each do |key|
          add_hidden_key(key)
        end
      end

      private

      def add_hidden_key(key)
        key = key.to_s # Support symbols by forcing to string
        hide_brackets(key)
        hide_fetch(key)
        hide_values_at
      end

      def hide_brackets(key)
        allow(ENV).to(receive(:[]).with(key).and_return(nil))
      end

      def hide_fetch(key)
        allow(ENV).to(receive(:fetch).with(key)) do |_|
          raise KeyError, "key not found: \"#{key}\""
        end
        allow(ENV).to(receive(:fetch).with(key, anything)) do |_, default_val|
          default_val
        end
      end

      # Rides on the fetch hider!
      def hide_values_at
        allow(ENV).to(receive(:values_at)) do |*args|
          args.map { |arg| ENV.fetch(arg, nil) }
        end
      end
    end
  end
end
