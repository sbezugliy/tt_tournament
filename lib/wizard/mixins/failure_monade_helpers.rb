# frozen_string_literal: true

module Wizard
  # Module contains failure monade mixins
  module FailureMonadeHelpers
    def teams_too_small(size)
      Failure("Teams count less then #{size}.")
    end

    def teams_are_not_complete()
      Failure("Teams are not complete. Should be selected #{@size * 2}.")
    end

    # TODO: Service failure result
    def stub_none
      None()
    end
  end
end
