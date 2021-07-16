Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :photos, only: [:index, :create, :new, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
  resources :users do
   resource :follow
   resources :followings 
    resources :followers
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
