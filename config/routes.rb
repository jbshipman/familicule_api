Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resources :user_cules
  resources :cules, only: [:index, :show, :create]

  get :users_in_cule, to: "cules#users_in_cule"

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
