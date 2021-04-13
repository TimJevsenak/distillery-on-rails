Rails.application.routes.draw do
  get 'search/index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get '/search' => 'search#index', :as => 'search'
end
