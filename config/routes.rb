Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: [:index, :new, :create] do
    get "/orders/add", to: "orders#add"
  end

  get "/users/:id/products", to: "products#listing"

  resources :categories, only: [:show]
end
