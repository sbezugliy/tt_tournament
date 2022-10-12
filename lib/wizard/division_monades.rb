# frozen_string_literal: true

module Wizard
  # Class implementing dividing group of 16 teams on division_a and division_b
  class DivisionMonades < BaseMonades
    def call(teams, size: 8)
      @size = size
      @teams = teams
      return teams_are_not_complete unless teams_complete?
      divisions = teams.divide_array
      @result = { a: divisions[0], b: divisions[1] }
      super()
    end
  end
end
