Rails.application.routes.draw do
  get 'users/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'comments/create'
  get 'comments/update'
  get 'comments/delete'
  get 'search/index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get '/search' => 'search#index', :as => 'search'
  get '/brewery/:id' => 'search#show', :as => 'brewery'
  get '/user/:id' => 'users#show', :as => 'user'

  resources :comments
  resources :user_comments
end
