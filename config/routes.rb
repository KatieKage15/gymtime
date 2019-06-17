Rails.application.routes.draw do
  resources :instructors
  resources :clients, only: [:create, :show, :new]
  resources :trainings

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/trainings', to: 'sessions#create'

  root 'application#welcome'
  get '/auth/:provider/callback' => 'sessions#create'
end
