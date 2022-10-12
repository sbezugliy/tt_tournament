# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'tournamen build successfully' do
  it do
    expect(subject.call(teams).success.keys)
      .to eq(%i[divisions quarter_final half_final final])
  end
end
