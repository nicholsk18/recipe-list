Rails.application.routes.draw do
  root 'home#index'
  get '/recipes', to: 'recipes#index'
  get '/recipe/:id', to: 'recipes#show'
  
  # admin routes
  namespace :admin do
    # get 'dashboard/index'
    get '/dashboard', to: 'dashboard#index'
    post '/recipes/create'

    resources :recipes
  end
  
  resources :tasks
  # resources :recipes
end
