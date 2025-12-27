Rails.application.routes.draw do
  get "home/index"
  devise_for :users

  resources :resumes do 
    resource :profile
    resources :skills
    resources :experiences
    member do
      get :download
    end
  end

  get "resume_templates", to: "resume_templates#index"

  root "home#index"
end
