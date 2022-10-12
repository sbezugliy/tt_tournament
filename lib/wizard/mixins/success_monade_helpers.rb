# frozen_string_literal: true

module Wizard
  # Module contains success monade mixins
  module SuccessMonadeHelpers
    def success
      Success @result
    end
  end
end
