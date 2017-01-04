Rails.application.routes.draw do
  root "home_pages#home"
  
  devise_for :users
  namespace :admin do
    resources :users, only: [:index, :destroy, :update]
    resources :categories
    resources :products, except: :show
    resources :suggestions, only: [:index, :update, :destroy]
  end
  resources :suggestions, except: [:edit, :update, :show]
  resources :products, only: [:index, :show]
  resources :carts, except: [:edit, :update, :show]
end
