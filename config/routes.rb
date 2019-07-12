Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    mount Ckeditor::Engine => '/ckeditor'
    root 'cates#index'
    get '/signup', to: 'users#new'
    post '/signup',  to: 'users#create'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    resources :users
    resources :cates
    resources :books
    resources :chapters

    namespace :admin do
      root 'book_pages#home'
      get    '/login',   to: 'sessions#new'
      post   '/login',   to: 'sessions#create'
      delete '/logout',  to: 'sessions#destroy'
      resources :users
      resources :cates
      resources :books
      resources :chapters
    end
  end
end
