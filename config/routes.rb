Rails.application.routes.draw do
  devise_for :users
  resources :items
  resources :users
  resources :purchases


  root to: 'items#index'

end
