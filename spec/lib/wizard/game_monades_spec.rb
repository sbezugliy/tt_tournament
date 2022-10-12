# frozen_string_literal: true

require 'rails_helper'
require_relative './shared_examples/game_examples'

RSpec.describe Wizard::GameMonades, type: :monades do
  subject { described_class.new }

  let(:args) { [10, 15] }

  describe '#call' do
    let(:stage) { subject }

    let(:teams_are_not_complete) { 'Teams are not complete. Should be selected 2.' }

    score_cases = [[], [3, 5], [4, 4], [0, 0], [0, 1], [1, 0], [1, 1], [nil, nil]]
    include_context 'when teams are ready game created successfully', score_cases

    context 'when only one team provided' do
      let(:args) { [10, nil] }

      it { expect(stage.call(*args).failure).to eq(teams_are_not_complete) }
      it { expect(stage.call(*args.reverse).failure).to eq(teams_are_not_complete) }
    end

    context 'when teams and scores are not defined' do
      let(:args) { [nil, nil] }

      it { expect(stage.call(*args).failure).to eq(teams_are_not_complete) }
    end

    context 'when teams are not defined, but scores provided' do
      let(:args) { [nil, nil, 3, 5] }

      it { expect(stage.call(*args).failure).to eq(teams_are_not_complete) }
    end
  end
end
