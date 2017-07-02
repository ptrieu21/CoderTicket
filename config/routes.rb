Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'orders', to: 'orders#index'
  root 'events#index'

  resources :events do
    resources :tickets
    resources :orders, only: [:new, :create]
    member do
      post 'publish'
      post 'unpublish'
    end
  end

  resources :venues, only: [:new, :create]

  

  get "my_event", to: "events#my_event"
  get "upcoming", to: "events#index"
end
