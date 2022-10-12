# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tournaments/index', type: :view do
  before do
    assign(:tournaments, [
             Fabricate(:tournament,
                       name: 'World Cup',
                       status: 1),
             Fabricate(:tournament,
                       name: 'Europe cup',
                       status: 2)
           ])
  end

  xit 'renders a list of tournaments' do
    render
    assert_select 'tbody>tr>td', text: 'World Cup'.to_s, count: 1
    assert_select 'tbody>tr>td', text: 'Europe Cup'.to_s, count: 1
  end
end
