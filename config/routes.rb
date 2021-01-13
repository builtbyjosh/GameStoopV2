Rails.application.routes.draw do
  # get 'line_item/index'
  # get 'line_item/show'
  # get 'line_item/new'
  # get 'line_item/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :games, only: [:index, :show]
  
  resources :carts, only: [:index, :new, :create] do
    resources :line_items, only: [:show, :new, :index]
  end

  resources :line_items, only: [:create, :index]
end
