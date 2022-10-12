# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tournaments/edit', type: :view do
  let(:tournament) do
    Fabricate(:tournament,
              name: 'World Cup',
              status: 1)
  end

  before do
    assign(:tournament, tournament)
  end

  xit 'renders the edit tournament form' do
    render

    assert_select 'form[action=?][method=?]', tournament_path(tournament), 'post' do
      assert_select 'input[name=?]', 'tournament[name]'

      assert_select 'input[name=?]', 'tournament[status]'
    end
  end
end
