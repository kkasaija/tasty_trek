Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_in', to: 'users/sessions#new'
    get '/users/sign_out', to: 'users/sessions#destroy'
  end
  root 'home#index'
  get '/public_recipes', to: 'home#index'
  resources :food
  resources :recipes do
    resources :recipe_food
    resources :shopping_list
  end 

end
