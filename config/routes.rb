Rails.application.routes.draw do
  root 'home#index'
  get '/recipes', to: 'recipes#index'
  get '/recipe/:id', to: 'recipes#show'

  # Sign up and registration
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  post 'sign_out', to: 'sessions#destroy', as: 'log_out'
  
  # admin routes
  namespace :admin do
    # get 'dashboard/index'
    get '/dashboard', to: 'dashboard#index'
    post '/recipes/create'

    # resources :recipes
    get '/recipe/:id', to: 'recipes#show'
    get '/recipe/edit/:id', to: 'recipes#edit'
    post '/recipe/edit/:id', to: 'recipes#update'
  end
  
  resources :tasks
  # resources :recipes
end
