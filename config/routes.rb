Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { registrations: 'users/registrations'}
  resources :posts do
    resources :comments
  end

  resources :comments, only: %i[ update create destroy ]

end
