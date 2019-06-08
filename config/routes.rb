Rails.application.routes.draw do
  resources :instructors
  resources :clients
  resources :trainings

  root 'welcome#home'
  get '/auth/facebook/callback' => 'sessions#create'
end 
