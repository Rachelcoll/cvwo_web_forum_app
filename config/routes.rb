Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :articles
  get :personal_article, to: "articles#personal_article"
  delete :logged_out, to: "sessions#logged_out"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"
end
