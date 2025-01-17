Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  
  resources :library_admins, param: :_username
  
  resources :libraries, only: [:index, :create] do
    resources :borrowers, only: [:index, :create] do
      member do
        post :lend_book
        post :return_book
      end
    end

    resources :books, only: [:index, :create] do
      post '/search', to: 'books#search', on: :collection
    end
  end
end
