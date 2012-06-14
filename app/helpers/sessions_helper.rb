module SessionsHelper

  def sign_in(gamer)
    cookies.permanent[:remember_token] = gamer.remember_token
    self.current_gamer = gamer
  end
  
  def signed_in?
    !current_gamer.nil?
  end

  def current_gamer=(gamer)
    @current_gamer = gamer
  end

  def current_gamer
    @current_gamer ||= Gamer.find_by_remember_token(cookies[:remember_token])     # Useless! Don't use this line.
  end

  def sign_out
    self.current_gamer = nil
    cookies.delete(:remember_token)
  end

end
