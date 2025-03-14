Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :lessons, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end

  namespace :trainer do
    resources :bookings, only: [:index]
  end

  resources :users, only: [:edit, :update, :show]

  resources :bookings, only: [:update]


  get 'dashboard', to: 'dashboard#dashboard'
  # Defines the root path route ("/")
  # root "posts#index"
end
