Rails.application.routes.draw do
  root to: 'static#home'
  get 'registrations/create'
  get 'sessions/create'
  get :logged_in, to: 'sessions#logged_in'
  delete :logout, to: 'sessions#logout'

  resources :sessions, only: :create
  resources :registration, only: :create
end
