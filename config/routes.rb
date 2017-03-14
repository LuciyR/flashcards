Rails.application.routes.draw do
  root 'pages#index'
  resources :cards
  resources :users,         only: [:new, :create, :edit, :update]
  resources :user_sessions, only: [:new, :create, :destroy]
  post 'check_card',      to: 'pages#check_card'
  get  'login',           to: 'user_sessions#new', as: :login
  post 'logout',          to: 'user_sessions#destroy', as: :logout
  post 'oauth/callback',  to: 'oauths#callback'
  get  'oauth/callback',  to: 'oauths#callback'
  get  'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
end
