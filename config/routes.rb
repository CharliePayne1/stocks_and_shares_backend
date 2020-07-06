Rails.application.routes.draw do

  resources :users

  resources :sectors

  resources :stocks, only: [:new, :create, :edit, :update, :delete]

  get '/stocks', to: 'stocks#index'
  post '/stocks', to: 'stocks#index'

  get '/stocks/:stock_symbol', to: 'stocks#show'

  get '/stocks/:stock_symbol/:date', to: 'stocks#show'
  
end
