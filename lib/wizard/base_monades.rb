# frozen_string_literal: true

module Wizard
  # Base class includes mixins and implements common logics
  class BaseMonades
    include Dry::Monads[:maybe, :result, :do]
    include SuccessMonadeHelpers
    include FailureMonadeHelpers

    def call(size: 4)
      @teams ||= []
      @size = size
      @result ||= None()
      success
    end

    include UtilsHelpers

    def teams_complete?
      return false if @teams.blank?
      return false if @teams.length < (@size * 2)

      @teams = @teams[0..((@size * 2) - 1)]
      true
    end 
  end
end
