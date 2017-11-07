Rails.application.routes.draw do
  root 'index#index'

  resources :themes
  get 'dashboard', to: 'dashboard#show'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
end
