# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tournaments/new', type: :view do
  before do
    assign :tournament, Fabricate(:tournament)
    assign :teams, Fabricate.times(16, :team)
  end

  xit 'renders new tournament form' do
    render

    assert_select 'form[action=?][method=?]', tournaments_path, 'post' do
      assert_select 'input[name=?]', tournament[:name]

      assert_select 'input[name=?]', tournament[:status]
    end
  end
end
