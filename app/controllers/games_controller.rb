class GamesController < ApplicationController

  def create
    @current_game = current_gamer.games.create
    render 'home/index'
  end

end
