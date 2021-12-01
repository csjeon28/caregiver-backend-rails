Rails.application.routes.draw do
  resources :caregivers do
    resources :jobs
    resources :candidates
  end  
  post "caregiver/login", to:"caregivers#login"
  get "caregiver/auto_login", to:"caregivers#auto_login"
  get "/all-jobs", to:"jobs#all_jobs"

  resources :parents do
    resources :jobs
  end
  post "parent/login", to:"parents#login"
  get "parent/auto_login", to:"parents#auto_login"
  patch "parents/:id/jobs", to:"jobs#update"
end
