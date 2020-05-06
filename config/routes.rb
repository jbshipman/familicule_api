Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resources :user_cules
  resources :cules, only: [:index, :show, :create]
  resources :events, only: [:index, :show, :create, :destroy]
  # resources :events
  # get :index_all, to: "events"

  get :users_in_cule, to: "cules#users_in_cule"

  resources :sessions, only: [:create, :update]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

  resources :registrations, only: [:create]

  resources :profiles, only: [:show, :update]

  root to: "static#home"
end
