# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'division created successfully' do
  let(:result) { stage.call(teams).success }
  context 'when all teams are ready' do
    it { expect(result.keys).to eq(%i[a b]) }
    it { expect(result).to include(a: be_an(Array), b: be_an(Array)) }
    it { expect(result[:a].length).to be(8) }
    it { expect(result[:b].length).to be(8) }
  end
end

RSpec.shared_examples 'teams are not complete failure' do |teams, required_size|
  let(:teams_are_not_complete) { "Teams are not complete. Should be selected #{required_size}." }
  it { expect(stage.call(teams).failure).to eq(teams_are_not_complete) }
end
