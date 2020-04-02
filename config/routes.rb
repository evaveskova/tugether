Rails.application.routes.draw do
  get 'sessions/create'
  root to: 'static#home'

  resources :sessions, only: :create
  resources :registration, only: :create
end
