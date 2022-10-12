# frozen_string_literal: true

require_relative './stages/quarter_final'
require_relative './stages/half_final'
module Wizard
  module Stages
    # Mixin implements extensins definingste
    module TournamentStages
      private

      def divide
        @divisions = DivisionMonades.new.call(@teams)
      end

      ##
      # Quarter final stage
      include ::Wizard::Stages::QuarterFinal

      def quarter_final
        return None() unless @divisions&.success?

        @division_groups = {}
        @divisions.success.each_pair do |division, teams|
          division_to_groups(division, teams)
        end
      end

      def division_to_groups(division, teams)
        @division_groups[division] = GroupMonades.new.call(teams, strategy: :pairs)
      end

      ##
      # Half final stage
      include ::Wizard::Stages::HalfFinal

      def half_final
        return None() unless @quarter_final_groups&.success?

        @half_final_groups = nil
      end

      ##
      # Final stage
      def final
        return None() unless @half_final_groups&.success?

        @final_match = nil
      end

      def build_result
        @result = {
          divisions: @divisions,
          quarter_final: @quarter_final_groups,
          half_final: @half_final_groups,
          final: @final_match
        }
      end
    end
  end
end
