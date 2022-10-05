Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  resources :admins, only: %i[new create]

  namespace :admins do
    resources :users
  end

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

  root "pages#index"
end
