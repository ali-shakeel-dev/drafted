Rails.application.routes.draw do
  get "home/index"
  devise_for :users

  resources :resumes do 
    resource :profile
    member do
      get :download
    end
  end

  root "home#index"
end
