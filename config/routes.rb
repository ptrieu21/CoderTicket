Rails.application.routes.draw do
  devise_for :users 
  get 'orders', to: 'orders#index'
  root 'events#index'

  resources :events do
    resources :tickets
    resources :orders, only: [:new, :create]
  end

  get "upcoming", to: "events#index"
end
