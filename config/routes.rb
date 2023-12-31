Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products, only: [:index, :new, :create, :show] do
    patch "/orders", to: "orders#add"
  end

  patch "/orders/deal", to: "orders#deal"

  get "/orders/confirmation", to: "orders#confirmation"

  resources :categories, only: [:show]

  resources :orders, only: [:show, :index]

end
