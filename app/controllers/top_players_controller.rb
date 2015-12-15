class TopPlayersController < ApplicationController
  def index
    @players = TopPlayer.order(total_win: :desc).limit(11)
    render :layout => false
  end
end
