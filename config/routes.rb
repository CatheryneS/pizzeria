Rails.application.routes.draw do
  get 'welcome/index'

  resources :users, except: [:new] do
    resources :orders, only: [:index]
  end
  
  resources :orders 

  get 'signup', to: 'users#new'
  
  get 'login', to:'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create_facebook'

  resources :pizzas
  
  root 'welcome#index'

  # <#---Nested Routes--->
  # '/users/:id/orders' #shows users orders
  # '/users/:id/pizzas' #shows pizzas created by or once ordered by the pizzas
  # '/pizzas/:id/orders' #shows orders that contain pizzas
  # '/pizzas/:id/users' #shows users that ordered the pizza
end
