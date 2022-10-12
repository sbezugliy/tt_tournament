# frozen_string_literal: true

require_relative './mixins/tournament_stages'

module Wizard
  ##
  # Class implementing common logics based on railway principles.
  class TournamentMonades < BaseMonades
    def call(teams)
      @size = 8
      @teams = teams.shuffle
      return teams_are_not_complete unless teams_complete?
      start_tournament
      super()
    end

    private

    def start_tournament
      divide
      quarter_final
      half_final
      final
      build_result
    end

    include ::Wizard::Stages::TournamentStages
  end
end
