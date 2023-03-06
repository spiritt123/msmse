Rails.application.routes.draw do

  root 'home#index'
  get 'home/index'
  get 'home/root'
  get 'home/admin'
  get 'home/user'

  post 'home/add_user'
  post 'home/change_user'
  post 'home/add_admin'
  post 'home/change_admin'
  post 'home/set_user_ipmi'
  post 'home/set_lan_ipmi'
  post 'home/set_power_ipmi'
  get 'home/scan'
  post 'home/scan'

  get 'home/download'




  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
