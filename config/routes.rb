Rails.application.routes.draw do
  root 'pages#index'
  resources :cards
  post 'check_card', to: "pages#check_card"
end
