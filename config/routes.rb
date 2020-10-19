Rails.application.routes.draw do
  get 'welcome/index'

  resources :users, except: [:new] 

  get 'signup', to: 'users#new'
  
  get 'login', to:'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to:'sessions#destroy'

  resources :pizzas 
  
  root 'welcome#index'
end
