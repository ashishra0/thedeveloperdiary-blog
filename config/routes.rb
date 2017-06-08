Rails.application.routes.draw do
  devise_for :users
  get 'site/index'
  resources :articles
  root 'articles#index'
end
