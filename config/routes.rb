Rails.application.routes.draw do
  resources :users, except: [:new] 

  get 'signup', to: 'users#new'

  resources :sessions, only: [:create]
  
  get 'login', to:'sessions#new'
  get 'logout', to:'sessions#destroy'
end
