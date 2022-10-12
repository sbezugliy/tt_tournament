# frozen_string_literal: true

module Wizard
  ##
  # Class implements dividing of division on matches
  class GroupMonades < BaseMonades
    ##
    # Creates group of games from 8, 4 or 2 teams.
    # Params:
    # @param [Array<Integer>, Array<Array<Integer, Integer>> ] teams array of team id's
    # @param [Hash] opts parameters to build a group
    # @option opt [Hash<:strategy, :pairs>] builds random set of games, uses by default if didn't passed scores
    # @option opt [Hash<:strategy, :by_scores>] builds group by principle best plays with worst team, and so on...

    def call(teams, strategy: :pairs, size: 4)
      @teams = teams
      @strategy = strategy
      @size = size
      return teams_are_not_complete unless teams_complete?

      @result = build_group
      super()
    end

    private

    def build_group
      return @teams.sort_by_score.best_with_worst if @strategy == :by_scores

      @teams.divide_array @size
    end
  end
end
