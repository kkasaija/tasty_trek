Rails.application.routes.draw do
  root 'home#index'
  resources :food
  resources :users
  resources :recipes do
    resources :recipe_food
  end 

end
