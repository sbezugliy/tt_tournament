# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'included match with scores' do |match_number|
  context "and match number is #{match_number}" do
    it { expect(stage.call(teams).success[match_number][0]).to be_instance_of Team }
    it { expect(stage.call(teams).success[match_number][1]).to be_instance_of Team }
  end
end

RSpec.shared_examples 'group created successfully' do
  context 'when all teams are ready' do
    it { expect(stage.call(teams).success).to be_an(Array) }
    it { expect(stage.call(teams).success.length).to be(4) }

    4.times do |match_number|
      include_examples 'included match with scores', match_number
    end
  end
end
