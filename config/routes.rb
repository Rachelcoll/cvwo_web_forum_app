Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :articles do
    resources :comments
  end
  resources :games, only: [:index] do
    member do
      get "avg_score"
      get "current_game"
    end
    resources :reviews, only: [:index, :create, :destroy]
  end

  get '/articles/tag/:tag', to: "articles#view_by_tag"
  get :personal_article, to: "articles#personal_article"
  delete :logged_out, to: "sessions#logged_out"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"
  get ':id/games', to: "games#user_games"
end
