Rails.application.routes.draw do
  devise_for :users
  resources :user_stocks, only: %i[create destroy]
  resources :friendships, only: %i[create destroy]
  resources :users, only: %i[show]

  root 'home#index'
  get 'about', to: 'home#about'
  get 'my_friends', to: 'users#my_friends'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'search_friend', to: 'users#search'
end
