Rails.application.routes.draw do
  devise_for :users
  root 'events#index'

  resources :events do
    resources :tickets
    resources :orders
  end
  get "upcoming", to: "events#index"
end
