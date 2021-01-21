Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get 'line_item/index'
  # get 'line_item/show'
  # get 'line_item/new'
  # get 'line_item/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'sessions#welcome'

  # session routes
  get '/login', to: 'sessions#login'
  post '/success', to: 'sessions#success'
  
  get '/signup', to: 'sessions#signup'
  post '/create', to: 'sessions#create'

  delete '/logout', to: 'sessions#logout'
  get '/checkout', to: 'sessions#checkout'
  post '/checkout', to: 'sessions#checkout'
  
  resources :users, only: [:show, :edit, :update] do
    # nested routes
    resources :carts, only: [:show]
  end
  resources :line_items, only: [:create, :destroy]
  resources :games, only: [:index, :show]
  resources :carts, only: [:create] do
    # nested routes
    resources :line_items, only: [:new, :create]
  end  

  # scope method routes
  get '/games/fps', to: 'games#fps'
  get '/games/strategy', to: 'games#strategy'
  get '/games/simulation', to: 'games#simulation'
  get '/games/platformer', to: 'games#platformer'

  
end
