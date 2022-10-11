Rails.application.routes.draw do
  devise_for :users

  resources :file_uploads, only: [:index, :create, :show]

  resources :contacts

  root "home#index"
end
