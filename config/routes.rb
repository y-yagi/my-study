Rails.application.routes.draw do
  root 'index#index'

  resources :studies
  resources :themes

  namespace :settings do
    resources :tokens, only: [:index, :new, :show, :create, :destroy]
  end

  get 'dashboard', to: 'dashboard#show'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  namespace :api do
    resources :studies, only: [:show, :create]
  end
end
