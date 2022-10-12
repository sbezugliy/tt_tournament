# frozen_string_literal: true

require 'rails_helper'
require_relative './shared_examples/group_examples'

RSpec.describe Wizard::GroupMonades, type: :monades do
  subject { described_class.new }

  describe '#call' do
    let(:stage) { subject.call(team_ids, **args) }
    let(:args) { { strategy: :pairs, size: 4 } }
    # include_examples 'group created successfully'

    context 'when used :pairs strategy and size is 4' do
      let(:team_ids) { [10, 12, 43, 22, 11, 3, 5, 7] }
      let(:result) { [[10, 12], [43, 22], [11, 3], [5, 7]] }
      let(:args) { { strategy: :pairs, size: 4 } }

      it { expect(stage.success).to eq(result) }
    end

    context 'when used :by_scores strategy and size is 4' do
      let(:team_ids) do
        [[10, 4], [12, 2], [43, 0], [22, 1],
         [11, 0], [3, 5], [5, 2], [7, 3]]
      end
      let(:result) do
        [
          [[3, 5], [43, 0]],
          [[10, 4], [11, 0]],
          [[7, 3], [22, 1]],
          [[5, 2], [12, 2]]
        ]
      end
      let(:args) { { strategy: :by_scores, size: 4 } }

      it { expect(stage.success).to eq(result) }
    end

    context 'when used :by_scores strategy and size is 2' do
      let(:team_ids) { [[10, 4], [12, 2], [43, 0], [7, 3]] }
      let(:result) do
        [
          [[10, 4], [43, 0]],
          [[7, 3], [12, 2]]
        ]
      end
      let(:args) { { strategy: :by_scores, size: 2 } }

      it { expect(stage.success).to eq(result) }
    end

    context 'when used :by_scores strategy and size is 1' do
      let(:team_ids) { [[10, 4], [7, 3]] }
      let(:result) { [[[10, 4], [7, 3]]] }
      let(:args) { { strategy: :by_scores, size: 1 } }

      it { expect(stage.success).to eq(result) }
    end

    context 'when teams count less then 8 for size of 4' do
      let(:team_ids) { [10, 12, 43, 22, 11, 3] }
      let(:args) { { strategy: :pairs, size: 4 } }

      it { expect(stage.failure).to eq('Teams are not complete. Should be selected 8.') }
    end

    context 'when teams count more then 8 for size of 4' do
      let(:team_ids) { [10, 12, 43, 22, 11, 3, 5, 7, 9, 23] }
      let(:result) { [[10, 12], [43, 22], [11, 3], [5, 7]] }
      let(:args) { { strategy: :pairs, size: 4 } }

      it { expect(stage.success).to eq(result) }
    end 

    context 'when team is empty' do
      let(:team_ids) { [] }
      it { expect(stage.failure).to eq('Teams are not complete. Should be selected 8.') }
    end

    context 'when team is nil' do
      let(:team_ids) { nil }
      it { expect(stage.failure).to eq('Teams are not complete. Should be selected 8.') }
    end
  end
end
