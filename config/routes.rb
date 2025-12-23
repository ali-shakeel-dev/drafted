Rails.application.routes.draw do
  get "home/index"
  devise_for :users

  resources :resumes

  root "home#index"
end
