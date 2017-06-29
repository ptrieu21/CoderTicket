Rails.application.routes.draw do
  root 'events#index'

  resources :events do
    resources :tickets
  end
  get "upcoming", to: "events#index"
end
