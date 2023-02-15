Rails.application.routes.draw do
  root 'home#index'
  resources :food
  resources :users
end
