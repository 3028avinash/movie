Rails.application.routes.draw do
  resources :reviews
  get 'home/index'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  resources :users
  resources :movies 
    # resources :reviews
  # end

resources :sessions, only: [:new, :create, :destroy]
get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'
get 'sign_in', to: 'sessions#new'
post 'sign_in', to: 'sessions#create'


end
