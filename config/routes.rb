Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :orders
  end

  root to: 'items#index'

end
