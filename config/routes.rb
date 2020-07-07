Rails.application.routes.draw do

  resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

  get '/stocks', to: 'stocks#index'
  post '/stocks', to: 'stocks#index'
  # not being used yet 
  get '/stocks/:stock_symbol', to: 'stocks#show'
  get '/stocks/:stock_symbol/:date', to: 'stocks#show'
  
end
