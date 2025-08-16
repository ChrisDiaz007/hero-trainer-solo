Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :lessons, only: [:index, :show, :new, :create] do
    collection do
      get :classes
    end

    resources :bookings, only: [:new, :create]
  end

  namespace :trainer do
    resources :bookings, only: [:index]
  end

  resources :users, only: [:edit, :update, :show]

  resources :bookings, only: [:update]

  get 'dashboard', to: 'dashboard#dashboard'

end
