Rails.application.routes.draw do
  root 'recipes#index'
  get '/recipes', to: 'recipes#index'
  get '/recipe/:id', to: 'recipes#show'

  # Sign up and registration
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'sign_out', to: 'sessions#destroy'
  
  # admin routes
  namespace :admin do
    # get 'dashboard/index'
    get '/dashboard', to: 'dashboard#index'
    post '/recipe/create', to: 'recipes#create'

    # resources :recipes
    get '/recipe/new', to: 'recipes#new'
    get '/recipe/:id', to: 'recipes#show'
    get '/recipe/edit/:id', to: 'recipes#edit'
    post '/recipe/edit/:id', to: 'recipes#update'

    # route profile
    get '/profile/', to: 'profile#index'
  end
  
  resources :tasks
  # resources :recipes
end
