# require 'userconstraint'

Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root 'main#index'
  # , constraints: NoUserRequiredConstraint.new
  # root 'customer/products#index', constraints: CustomerConstraint.new
  # root 'florist/dashboard#index', constraints: FloristConstraint.new

  scope module: 'customer' do
    root 'main#index'
    resources :users
    resources :florists
    resources :customers
    resources :companies, only: [:index, :show]
    resources :products, only: [:index, :show]
    resources :sessions
    get 'cart', to: 'carts#show', as: :my_cart
    post 'products/:id', to: 'positions#create', as: :add_to_cart
    get 'account', to: 'users#edit', as: :account
    get 'login', to: 'sessions#new', as: :login
    delete 'logout', to: 'sessions#destroy', as: :logout
    get 'signin', to: 'users#new', as: :signin
    get 'companies/:id', to: 'companies#show', as: :named_company
  end

  namespace :admin do
    resources :companies
    resources :products
    resources :sessions
    get 'login', to: 'sessions#new', as: :login
  end

  namespace :florist do
    scope '/dashboard' do
      resources :users
      resources :sessions
      resources :companies
      resources :products
      resources :sessions
      get '', to: 'dashboard#index', as: :account
    end
    get 'login', to: 'sessions#new', as: :login
    get 'signin', to: 'users#new', as: :signin
    post 'users/new', to: 'users#create'
  end
end
