Rails.application.routes.draw do
  root 'books#index'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users

  namespace :admin do
    root 'book_pages#home'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    resources :users
  end
end
