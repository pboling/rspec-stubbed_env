# frozen_string_literal: true

# Test Helper
class Rails
  class << self
    def env
      "test"
    end
  end
end
