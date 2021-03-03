Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides

  root 'application#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'

  post '/rides' => 'rides#create'
end
