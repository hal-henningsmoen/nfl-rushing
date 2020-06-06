require 'rails_helper'

RSpec.describe "players/show", type: :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      name: "Name",
      team: "Team",
      position: "Position",
      attempts_per_game: 2.5,
      total_attempts: 3,
      total_yards: 4,
      average_yards_per_attempt: 5.5,
      yards_per_game: 6.5,
      rushing_touchdowns: 7,
      longest_rush: 8,
      longest_rush_is_touchdown: false,
      first_downs: 9,
      first_downs_percent: 10.5,
      twenty_plus: 11,
      forty_plus: 12,
      fumbles: 13
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Team/)
    expect(rendered).to match(/Position/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5.5/)
    expect(rendered).to match(/6.5/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10.5/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/12/)
    expect(rendered).to match(/13/)
  end
end
