class PlayersController < ApplicationController
  # GET /players
  # GET /players.csv
  def index
    @search = Player.ransack(params[:q])
    respond_to do |format|
      format.html { @players = @search.result.page(params[:page]) }
      format.csv {  send_data Player.to_csv(@search.result), filename: "rushing.csv" }
    end
  end
end
