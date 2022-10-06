require 'sidekiq/web'

class AdminConstraint
  def matches?(request)
    admin_id = request.session[:admin_id]
  end
end

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' , constraints: AdminConstraint.new

  resource :session, only: %i[new create destroy]

  resources :admins, only: %i[new create]

  resources :notifications, only: %i[new create]

  namespace :admins do
    resources :users
  end

  resources :users, only: %i[new create]
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

  root "pages#index"
end
