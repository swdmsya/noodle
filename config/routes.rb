Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'noodles#index'
  resources :noodles do
    resources :likes, only: [:create, :destroy]
  end
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
end
