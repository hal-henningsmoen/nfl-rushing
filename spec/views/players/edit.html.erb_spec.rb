require 'rails_helper'

RSpec.describe "players/edit", type: :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      name: "MyString",
      team: "MyString",
      position: "MyString",
      attempts_per_game: 1.5,
      total_attempts: 1,
      total_yards: 1,
      average_yards_per_attempt: 1.5,
      yards_per_game: 1.5,
      rushing_touchdowns: 1,
      longest_rush: 1,
      longest_rush_is_touchdown: false,
      first_downs: 1,
      first_downs_percent: 1.5,
      twenty_plus: 1,
      forty_plus: 1,
      fumbles: 1
    ))
  end

  it "renders the edit player form" do
    render

    assert_select "form[action=?][method=?]", player_path(@player), "post" do

      assert_select "input[name=?]", "player[name]"

      assert_select "input[name=?]", "player[team]"

      assert_select "input[name=?]", "player[position]"

      assert_select "input[name=?]", "player[attempts_per_game]"

      assert_select "input[name=?]", "player[total_attempts]"

      assert_select "input[name=?]", "player[total_yards]"

      assert_select "input[name=?]", "player[average_yards_per_attempt]"

      assert_select "input[name=?]", "player[yards_per_game]"

      assert_select "input[name=?]", "player[rushing_touchdowns]"

      assert_select "input[name=?]", "player[longest_rush]"

      assert_select "input[name=?]", "player[longest_rush_is_touchdown]"

      assert_select "input[name=?]", "player[first_downs]"

      assert_select "input[name=?]", "player[first_downs_percent]"

      assert_select "input[name=?]", "player[twenty_plus]"

      assert_select "input[name=?]", "player[forty_plus]"

      assert_select "input[name=?]", "player[fumbles]"
    end
  end
end
