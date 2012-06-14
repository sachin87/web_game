class GamersController < ApplicationController
   before_filter :signed_in_gamer, only: [:edit, :update]

  def show
    @gamer = Gamer.find(params[:id])
  end

  def new
    @gamer = Gamer.new
  end

  def create
    @gamer = Gamer.new(params[:gamer])
    if @gamer.save
      flash[:success] = "Welcome"
      sign_in @gamer
      redirect_to @gamer
    else
      flash[:error] = "Error while sign up."
      render 'new'
    end
  end

  def edit
    @gamer = Gamer.find(params[:id])
  end

  def update
    @gamer = Gamer.find(params[:id])
    if @gamer.update_attributes(params[:gamer])
      flash[:success] = "Gamer successfully updated."
      sign_in @gamer
      redirect_to @gamer
    else
      flash[:error] = "Error while updating"
      render 'edit'
    end
  end

   private

    def signed_in_gamer
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end

end