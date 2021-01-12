Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :games, only: :index
  
  resources :carts, only: [:index, :new, :create] do
    resources :line_items, only: [:show, :new]
  end

  resources :line_items, only: :create
end
