include ApplicationHelper

def valid_signin(gamer)
  fill_in "Email",    with: gamer.email
  fill_in "Password", with: gamer.password
  click_button "Sign in"
end

def sign_in(gamer)
  visit signin_path
  fill_in "Email",    with: gamer.email
  fill_in "Password", with: gamer.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = gamer.remember_token
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end
