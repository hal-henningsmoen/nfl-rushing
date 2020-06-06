class PlayersController < ApplicationController
  # GET /players
  # GET /players.json
  def index
    puts "player_params: #{player_params}"
    @players = Player.all
  end
  private
  # Only allow a list of trusted parameters through.
  def player_params
    params.permit(:search, :sort_by, :ascending)
      #Total Rushing Yards, Longest Rush and Total Rushing Touchdowns
  end
end
