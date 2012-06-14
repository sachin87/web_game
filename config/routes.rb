Battleship::Application.routes.draw do

  get "/home" => "home#index"
  get "/help" => "home#help"
  get "/about" => "home#about"
  get "/contact" => "home#contact"

  get 'signup' => 'gamers#create' , :as =>  :signup
  post 'signin' => 'sessions#create' , :as =>  :signin
  match 'signout' => 'sessions#deastroy' , :as =>  :signout

  resources :games

  resources :sessions

  resources :gamers

  root :to => 'home#index'

end
