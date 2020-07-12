Rails.application.routes.draw do

  resources :users, only: [:create]
  resources :stocks, only: [:index]
  resources :transactions, only: [:create, :destroy]

  post '/login', to: 'auth#login'
  get '/profile', to: 'users#profile'
  
  post '/stocks', to: 'stocks#index'
  
end
