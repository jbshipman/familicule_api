Rails.application.routes.draw do
  resources :sessions, only: [:create, :update]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  # update :update, to: "sessions#update"

  resources :registrations, only: [:create]

  resources :profiles, only: [:show, :update]
  # resources :users, only: [:show] do
  # end

  root to: "static#home"
end
