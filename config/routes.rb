
Rails.application.routes.draw do
  root 'users#index'
  get 'signup' =>'users#new'
  resources :users
  get 'search' => 'search#search'
  post 'review' => 'reviews#create'
  
  post 'login' => 'sessions#create'
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
end

