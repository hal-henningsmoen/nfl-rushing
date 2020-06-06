class PlayersController < ApplicationController

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end
  private
  # Only allow a list of trusted parameters through.
  def player_params
    params.require(:player).permit(:name, :team, :position, :attempts_per_game, :total_attempts, :total_yards, :average_yards_per_attempt, :yards_per_game, :rushing_touchdowns, :longest_rush, :longest_rush_is_touchdown, :first_downs, :first_downs_percent, :twenty_plus, :forty_plus, :fumbles)
  end
end
