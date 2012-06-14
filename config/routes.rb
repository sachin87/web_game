Battleship::Application.routes.draw do

  get "/home" => "home#index"
  get "/help" => "home#help"
  get "/about" => "home#about"
  get "/contact" => "home#contact"
  
  resources :sessions, only: [:new, :create, :destroy]

  get '/signup',  to: 'gamers#new'
  get '/signin',  to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  resources :games

  resources :sessions

  resources :gamers

  root :to => 'home#index'

end
