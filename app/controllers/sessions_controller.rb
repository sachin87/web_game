class SessionsController < ApplicationController

  def new
  end

  def create
    gamer = Gamer.find_by_email(params[:session][:email])
    if gamer && gamer.authenticate(params[:session][:password])
      sign_in gamer
      redirect_to gamer
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
