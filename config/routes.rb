
Rails.application.routes.draw do
  root to:'users#index'
  get 'signup' =>'users#new'
  resources :users
  get 'search' => 'search#search'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end