Rails.application.routes.draw do
 devise_for :users
 root to: 'tweets#index'
 resources :tweets, only: [:new,:create,:show,:destroy,:edit,:update]
 resources :users, only: [:show]
 resources :areas, only: [:show]
end
