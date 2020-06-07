class PlayersController < ApplicationController
  # GET /players
  # GET /players.json
  def index
    @search = Player.ransack(params[:q])
    puts "params: #{params}"
    @players = @search.result
  end
end
