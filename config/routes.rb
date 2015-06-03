Rails.application.routes.draw do
  root "recipes#index"

  devise_for :users
  
  resources :recipes do 
    resources :comments, only: [:create]
  end

  resources :categories
end
