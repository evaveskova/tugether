Rails.application.routes.draw do
  root to: 'static#home'
  get :logged_in, to: 'sessions#logged_in'
  delete :logout, to: 'sessions#logout'

  resources :sessions, only: :create
  resources :registrations, only: :create
end
