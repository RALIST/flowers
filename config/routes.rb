Rails.application.routes.draw do

  root 'main#index'

  resources :users
  get 'account', to: 'users#edit', as: :account

  resources :sessions
  get 'login', to: 'sessions#new', as: :login
  delete 'logout', to: 'sessions#destroy', as: :logout
  get 'signin', to: 'users#new', as: :signin
end
