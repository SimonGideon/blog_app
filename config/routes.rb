Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: 'user/sessions',
    passwords: 'user/passwords',
    registrations: 'user/registrations'
  }

  get '/search', to: 'search#index', as: 'search'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    authenticated :user do
      root 'users#index'
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end
end
