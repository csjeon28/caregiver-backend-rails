Rails.application.routes.draw do
  resources :caregivers do
    resources :jobs
    resources :candidates
  end  
  post "caregiver/login", to:"caregivers#login"
  get "caregiver/auto_login", to:"caregivers#auto_login"
  
  resources :parents do
    resources :jobs
    resources :candidates
  end
  post "parent/login", to:"parents#login"
  get "parent/auto_login", to:"parents#auto_login"

end
