Rails.application.routes.draw do
      # resources :parents, only: [:index, :show, :create, :update]
      # resources :caregivers, only: [:index, :show, :create, :update]
      # resources :jobs 

      # post '/parents/login', to: 'parents_auth#create'
      # post '/caregivers/login', to: 'caregivers_auth#create'
      # get '/home', to: 'home#show', only: [:show]

      resources :caregivers do
        resources :jobs
      end
      post "caregiver/login", to:"caregivers#login"
      get "caregiver/auto_login", to:"caregivers#auto_login"

      resources :parents do
        resources :schedules
        resources :jobs
      end
      post "parent/login", to:"parents#login"
      get "parent/auto_login", to:"parents#auto_login"

end
