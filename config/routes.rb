Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    match "/404", to: "errors#file_not_found", via: :all
    match "/422", to: "errors#unprocessable", via: :all
    match "/500", to: "errors#internal_server_error", via: :all
    mount Ckeditor::Engine => '/ckeditor'
    root "cates#index"
    get "/signup", to: "users#new"
    post "/signup",  to: "users#create"
    get    "/login",   to: "sessions#new"
    post   "/login",   to: "sessions#create"
    delete "/logout",  to: "sessions#destroy"
    resources :users
    resources :cates
    resources :books
    resources :chapters

    namespace :admin do
      root "book_pages#home"
      get    "/login",   to: "sessions#new"
      post   "/login",   to: "sessions#create"
      delete "/logout",  to: "sessions#destroy"
      resources :users
      resources :cates
      resources :books
      resources :chapters
    end
  end
end
