# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tournament, type: :model do
  subject { Fabricate.build :tournament, attrs }

  let(:attrs) { { name: 'World Cup' } }

  it { expect(subject).to be_valid }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }

  xit { is_expected.to validate_inclusion_of(:status).in_array(Tournament::STATUSES.keys) }

  it { expect(subject.status_name).to eq('draft') }

  context 'when status is `draft`' do
    let(:attrs) { { name: 'World Cup', status: 1 } }

    it { expect(subject.status_name).to eq('draft') }
  end

  context 'when status is `in_progress`' do
    let(:attrs) { { name: 'World Cup', status: 2 } }

    it { expect(subject.status_name).to eq('in_progress') }
  end

  context 'when status is `done`' do
    let(:attrs) { { name: 'World Cup', status: 3 } }

    it { expect(subject.status_name).to eq('done') }
  end
end
