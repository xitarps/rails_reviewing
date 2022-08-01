require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { registrations: 'users/registrations'}
  resources :posts do
    resources :comments
  end

  resources :comments, only: %i[ update create destroy ]

  # TODO - add login and only admin access
  mount Sidekiq::Web => '/sidekiq'
end
