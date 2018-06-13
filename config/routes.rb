Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'sessions/new'
  root 'posts#index'
  resources :posts
  resources :users, only: :show
  resources :tables
  resources :show
  resources :table

  

end
