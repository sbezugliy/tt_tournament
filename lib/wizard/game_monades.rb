# frozen_string_literal: true

module Wizard
  # Class implements match and returns two teams with scores
  class GameMonades < BaseMonades
    def call(team_a, team_b, score_a = nil, score_b = nil)
      @size = 1
      return teams_are_not_complete if team_a.nil? || team_b.nil?

      @score_a = score_a || make_goals
      @score_b = score_b || make_goals
      penalty if @score_a == @score_b
      @result = [
        [team_a, @score_a],
        [team_b, @score_b]
      ]
      super()
    end

    private

    def play
      main_game
    end

    def penalty
      penalty_result = [0, 1].shuffle
      @score_a += penalty_result[0]
      @score_b += penalty_result[1]
    end
  end
end
