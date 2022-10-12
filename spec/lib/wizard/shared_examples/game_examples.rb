# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'teams scores are calculated' do |team_number, scores, min_value|
  let(:scores) { scores }
  it do
    expect(stage.call(*args, *scores).success[team_number][1])
      .to be_an(Integer).and(be >= min_value)
  end
end

RSpec.shared_examples 'success for scores' do |scores|
  min_value = scores.map { |v| v.nil? ? 0 : v }.min || 0

  [0, 1].each do |team_number|
    include_examples 'teams scores are calculated', team_number, scores, min_value
  end
end

RSpec.shared_context 'when teams are ready game created successfully' do |score_cases|
  score_cases.each { |scores| include_context 'success for scores', scores }
end
