Rails.application.routes.draw do
  get 'user_cules/index'
  get 'user_cules/show'
  get 'user_cules/new'
  get 'user_cules/create'
  get 'user_cules/edit'
  get 'user_cules/update'
  get 'user_cules/destroy'
  resources :users, only: [:index, :show]
  resources :user_cules
  resources :cules, only: [:index, :show, :create]

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
