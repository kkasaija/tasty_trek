Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/sign_in', to: 'users/sessions#new'
  end
  root 'home#index'
  resources :food
  resources :users
  resources :recipes do
    resources :recipe_food
  end 

end
