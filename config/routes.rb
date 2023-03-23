Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get '/search', to: 'search#index', as: 'search'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
      resources :likes, only: [:create, :destroy]
    end
  end
end
