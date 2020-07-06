Rails.application.routes.draw do

  resources :users

  resources :sectors

  resources :stocks, only: [:index, :new, :create, :edit, :update, :delete]

  get '/stocks/:stock_symbol', to: 'stocks#show'

  get '/stocks/:stock_symbol/:date', to: 'stocks#show'
  
end
