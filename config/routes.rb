Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  root to: "pages#home"

  # Health check route for load balancers or monitoring
  get "up" => "rails/health#show", as: :rails_health_check

  # Routes for user dashboard and profile
  get "dashboard" => "pages#dashboard"
  get "profile" => "pages#profile"

  resources :villas do
    post 'add_favourite', to: 'favourites#create', as: :add_favourite
    delete 'remove_favourite', to: 'favourites#destroy', as: :remove_favourite
    resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :favourites, only: [:index]
end
