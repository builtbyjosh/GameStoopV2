Rails.application.routes.draw do
  # get 'line_item/index'
  # get 'line_item/show'
  # get 'line_item/new'
  # get 'line_item/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  

  # session routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  

  # scope method routes
  get '/games/fps', to: 'games#fps'
  get '/games/strategy', to: 'games#strategy'
  get '/games/simulation', to: 'games#simulation'
  get '/games/platformer', to: 'games#platformer'
  
  resources :users, only: [:show]
  resources :line_items, only: [:create, :index]
  resources :games, only: [:index, :show]
  resources :carts, only: [:index, :new, :create] do
    # nested routes
    resources :line_items, only: [:show, :new, :index]
  end  
end
