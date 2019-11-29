Rails.application.routes.draw do
 devise_for :users
 root to: 'tweets#index'
 resources :tweets, only: [:index,:new,:create,:show,:destroy,:edit,:update] do
  resources :comments, only: [:create]
  collection do
    get 'search'
  end
end
 resources :users, only: [:show]
 resources :areas, only: [:show]
end
