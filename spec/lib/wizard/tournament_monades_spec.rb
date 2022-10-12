# frozen_string_literal: true

require 'rails_helper'
require_relative './shared_examples/division_examples'
require_relative './shared_examples/tournament_examples'

RSpec.describe Wizard::TournamentMonades, type: :monades do
  subject { described_class.new }

  team_ids = [12, 23, 4, 11, 45, 43, 22, 7, 5, 33, 54, 21, 3, 2, 9, 41]
  let(:teams_are_not_complete) { 'Teams are not complete. Should be selected 16.' }

  describe '#call' do
    let(:stage) { subject }

    include_examples 'tournamen build successfully'

    include_examples 'division created successfully' do
      let(:result) { stage.call(teams).success[:divisions].success }
      let(:teams) { team_ids }
    end

    context 'when teams count less then 16' do
      let(:teams) { team_ids[0..12] }

      it { expect(subject.call(teams).failure).to eq(teams_are_not_complete) }
    end
  end
end
