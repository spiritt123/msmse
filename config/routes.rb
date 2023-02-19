Rails.application.routes.draw do

  root 'home#index'
  get 'home/index'
  get 'home/root'
  get 'home/admin'

  post 'home/add_user'
  post 'home/change_user'
  post 'home/add_admin'
  post 'home/change_admin'



  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
