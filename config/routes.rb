Rails.application.routes.draw do
  root 'static_pages#home'

  get '/theclub', to: 'static_pages#theclub', as: 'theclub'

  get    '/signup', to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
end
