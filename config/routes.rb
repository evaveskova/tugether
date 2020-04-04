Rails.application.routes.draw do
  root to: 'static#home'
  get :logged_in, to: 'sessions#logged_in'
  delete :logout, to: 'sessions#logout'
  post '/signup', to: 'registrations#create'

  resources :sessions, only: :create
end
