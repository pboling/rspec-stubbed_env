# frozen_string_literal: true

# Class to help with testing
class FooByEnv
  attr_reader :array, :size, :env

  def initialize
    @env = Rails.env.to_s
    @array = case @env
    when "test" then ["localhost:123", "localhost:124"]
    when "development" then [ENV.fetch("MEDIUM_1", nil), ENV.fetch("MEDIUM_2", nil)]
    when "production" then [
      ENV.fetch("BIG_1", nil),
      ENV.fetch("BIG_2", nil),
      ENV.fetch("BIG_3", nil),
      ENV.fetch("BIG_4", nil),
    ]
    end.compact
    @size = @array.length
  end
end
