Rails.application.routes.draw do
  resources :instructors
  resources :clients, only: [:new, :create, :show]
  resources :trainings

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/trainings', to: 'sessions#create'

  root 'welcome#home'
  get '/auth/:provider/callback' => 'sessions#create'
end
