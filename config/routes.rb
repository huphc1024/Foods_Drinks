Rails.application.routes.draw do
  root "static_pages#home"

  get "/about", to: "static_pages#about"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "products/index"
  get "products/show"
  get "/cart", to: "carts#show"
  post "/remove_item", to: "carts#remove_item"
  post "/update_item", to: "carts#update_item"
  delete "/cart", to: "carts#destroy"

  resources :ratings, only: :create
  resources :users, except: %i(index destroy)
  resources :orders
  resource :cart, only: [:show]
  resources :order_items, only: %i(create update destroy)
  namespace :admin do
    resources :users, except: %i(index destroy)
    resources :products
  end
end
