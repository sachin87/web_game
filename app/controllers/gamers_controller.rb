class GamersController < ApplicationController

  def create
    @gamer = Gamer.new(params[:gamer])
    if @gamer.save
      flash[:notice] = "Successfully signed up."
    else
      flash[:notice] = "Error while sign up."
    end
  end

end
