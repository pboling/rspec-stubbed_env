# frozen_string_literal: true

module RSpec
  module StubbedEnv
    module Version
      VERSION = "1.0.5"
    end

    # Backwards compatability shim.
    VERSION = Version::VERSION
  end
end
