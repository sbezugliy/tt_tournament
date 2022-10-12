# frozen_string_literal: true

require 'rails_helper'
require_relative './shared_examples/division_examples'

RSpec.describe Wizard::DivisionMonades, type: :monades do
  subject { described_class.new }

  team_ids = [12, 23, 4, 11, 45, 43, 22, 7, 5, 33, 54, 21, 3, 2, 9, 41]

  describe '#call' do
    not_complete_cases = [nil, [], team_ids[0..12]]
    let(:stage) { subject }

    let(:teams) { team_ids }

    include_examples 'division created successfully'

    not_complete_cases.each do |team|
      include_examples 'teams are not complete failure', team, 16
    end
  end
end
