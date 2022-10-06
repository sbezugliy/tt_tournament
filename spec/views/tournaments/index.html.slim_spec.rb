require 'rails_helper'

RSpec.describe "tournaments/index", type: :view do
  before(:each) do
    assign(:tournaments, [
      Tournament.create!(
        name: "Name",
        games: ""
      ),
      Tournament.create!(
        name: "Name",
        games: ""
      )
    ])
  end

  it "renders a list of tournaments" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
