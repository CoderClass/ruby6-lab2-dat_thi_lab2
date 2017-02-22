Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  resources :sessions

  get '/login', to: 'sessions#new'
end
