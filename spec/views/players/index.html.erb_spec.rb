require 'rails_helper'

RSpec.describe "players/index", type: :view do
  before(:each) do
    assign(:players, [Player.create!(name: "Name", team: "Team", position: "Position", attempts_per_game: 2.5, total_attempts: 3, total_yards: 4, average_yards_per_attempt: 5.5, yards_per_game: 6.5, rushing_touchdowns: 7, longest_rush: 8, longest_rush_is_touchdown: false, first_downs: 9, first_downs_percent: 10.5, twenty_plus: 11, forty_plus: 12, fumbles: 13
    ), Player.create!(name: "Name", team: "Team", position: "Position", attempts_per_game: 2.5, total_attempts: 3, total_yards: 4, average_yards_per_attempt: 5.5, yards_per_game: 6.5, rushing_touchdowns: 7, longest_rush: 8, longest_rush_is_touchdown: false, first_downs: 9, first_downs_percent: 10.5, twenty_plus: 11, forty_plus: 12, fumbles: 13
    )
    ])
  end

  it "renders a list of players" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Team".to_s, count: 2
    assert_select "tr>td", text: "Position".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.5.to_s, count: 2
    assert_select "tr>td", text: 6.5.to_s, count: 2
    assert_select "tr>td", text: 7.to_s, count: 2
    assert_select "tr>td", text: 8.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: 9.to_s, count: 2
    assert_select "tr>td", text: 10.5.to_s, count: 2
    assert_select "tr>td", text: 11.to_s, count: 2
    assert_select "tr>td", text: 12.to_s, count: 2
    assert_select "tr>td", text: 13.to_s, count: 2
  end
end
