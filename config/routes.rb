Rails.application.routes.draw do
  root "home_pages#home"
  
  devise_for :users
  namespace :admin do
    resources :users, only: [:index, :destroy, :update]
    resources :categories
    resources :products, except: :show
  end
end
