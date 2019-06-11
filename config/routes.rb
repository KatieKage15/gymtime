Rails.application.routes.draw do
  resources :instructors
  resources :clients
  resources :trainings

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/trainings', to: 'sessions#create'

  root 'clients#new'
  get '/auth/:provider/callback' => 'sessions#create'
end
