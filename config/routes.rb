Rails.application.routes.draw do
  resources :jobs
  resources :parents
  resources :caregivers

  # get '/login', to: 'auth#login'
  # get '/auto_login', to: 'auth#auto_login'

  # get '/parents/auto_login', to: 'parents_sessions#auto_login'
  # get '/caregivers/auto_login', to: 'caregivers_sessions#auto_login'
  post '/parents/login', to: 'parents_sessions#create'
  post '/caregivers/login', to: 'caregivers_sessions#create'
  get '/home', to: 'home#show', only: [:show]
end
