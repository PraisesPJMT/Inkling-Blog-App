Rails.application.routes.draw do
  devise_for :users
  # devise_scope :user do
  #   root to: "users#index"
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "users#index"

  get "users/token" => 'users#token', :as => :access_token

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show] do
        resources :posts, only: %i[index show new create destroy] do
          resources :comments, only: %i[new create destroy]
          resources :likes, only: %i[create]
        end
      end
    end
  end
end
