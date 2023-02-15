Rails.application.routes.draw do
  root 'home#index'
  resources :recipes do
    resources :recipe_food
  end 

end
