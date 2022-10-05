Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  resources :admins, only: %i[new create]

  resources :notifications, only: %i[new create destroy]

  namespace :admins do
    resources :users
  end

  resources :users, only: %i[new create]
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

  root "pages#index"
end
