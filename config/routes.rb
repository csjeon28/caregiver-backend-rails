Rails.application.routes.draw do
  resources :jobs
  resources :parents
  resources :caregivers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
