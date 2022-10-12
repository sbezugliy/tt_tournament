# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tournaments/show', type: :view do
  before do
    assign(:tournament, Fabricate(:tournament,
                                  name: 'World Cup',
                                  status: 1))
  end

  it 'renders tournament name' do
    render
    expect(rendered).to match(/World Cup/)
  end

  it 'renders tournament status' do
    render
    expect(rendered).to match(/draft/)
  end
end
