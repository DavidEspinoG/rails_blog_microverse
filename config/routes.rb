Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'users/:id', to: 'users#show'
  get 'users/:id/posts', to: 'posts#index'
  get 'users/:user_id/posts/:post_id', to: 'posts#show'
  get 'posts/new', to: 'posts#new'
  post 'posts/new', to: 'posts#create'
  get 'comment/new/:post_id', to: 'comment#new' 
  post 'comment/new/:post_id', to: 'comment#create' 
  post 'likes/new', to: 'likes#create'
  root "users#index"

end
