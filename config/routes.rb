Rails.application.routes.draw do
  get 'welcome/index'
  
  
  resources :users, except: [:new] do
    resources :orders, only: [:index]
  end
  
  resources :orders, only: [:new, :create, :edit, :update, :delete] 

  resources :pizzas do
        resources :reviews, shallow: true
  end
  
  resources :reviews, only: [:edit, :update, :destroy]
  
  get 'signup', to: 'users#new'
  
  get 'login', to:'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create_facebook'

  

  root 'welcome#index'
end
