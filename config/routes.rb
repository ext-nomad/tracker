Rails.application.routes.draw do
  resources :user_stocks
  get 'stocks/search'
  devise_for :users

  root 'home#index'
  get 'about', to: 'home#about'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
end
