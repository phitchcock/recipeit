Rails.application.routes.draw do
  root "recipes#index"

  devise_for :users
  
  resources :recipes do
    member do
      post :vote
    end

    resources :comments, only: [:create] do
      member do
        post :vote
      end
    end
  end
  resources :categories
  
end
