Rails.application.routes.draw do
  namespace :admins do
    resources :products
  end
  namespace :users do
    resources :products, only: %i[index show]
    resources :cart_products, only: %i[index create destroy]
    resources :orders, only: %i[index show new create]
  end
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root to: 'home#index'
end
