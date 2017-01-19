Rails.application.routes.draw do
  resources :tracks do
    resources :notes, only: [:new, :edit, :create, :destroy]
  end
  resources :albums
  resources :bands
  resources :users

  resource :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create]

  root to: 'bands#index'
end
