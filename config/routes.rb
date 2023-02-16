Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :food
  resources :users
  resources :recipes do
    resources :recipe_food
  end 

end
