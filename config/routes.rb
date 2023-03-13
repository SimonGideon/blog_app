Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/', to: 'users#index'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'

end
