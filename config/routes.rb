Rails.application.routes.draw do
  devise_for :users
  resources :user_stocks, only: %i[create]

  root 'home#index'
  get 'about', to: 'home#about'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
end
