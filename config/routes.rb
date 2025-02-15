Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  # Defines the root path route ("/")
  root to: "pages#home"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  # Health check route for load balancers or monitoring


  # Routes for user dashboard and profile

  get "dashboard" => "pages#dashboard"
  get "profile" => "pages#profile"

  resources :villas do
    post 'add_favourite', to: 'favourites#create', as: :add_favourite
    delete 'remove_favourite', to: 'favourites#destroy', as: :remove_favourite
    resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  end


  resources :bookings do
    member do
      post :confirm
    end
  end

  resources :favourites, only: [:index]

end
