Rails.application.routes.draw do
  root 'users#index'
  get '/search', to: 'search#index', as: 'search'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
    end
  end
end





