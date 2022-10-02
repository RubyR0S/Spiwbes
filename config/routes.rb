Rails.application.routes.draw do
  
  resources :admin, only: %i[new create]

  namespace :admin do
    resources :users
  end

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

  root "pages#index"
end
