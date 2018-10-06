# frozen_string_literal: true

class FooByEnv
  attr_reader :array, :size, :env
  def initialize
    @env = Rails.env.to_s
    @array = case @env
             when 'test' then ['localhost:123', 'localhost:124']
             when 'development' then [ENV['MEDIUM_1'], ENV['MEDIUM_2']]
             when 'production' then [ENV['BIG_1'], ENV['BIG_2'], ENV['BIG_3'], ENV['BIG_4']]
             end.compact
    @size = @array.length
  end
end
