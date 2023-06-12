Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#list"
  get 'users/:id', to: 'users#show'
  get 'users/:id/posts', to: 'posts#list'
  get 'users/:user_id/posts/:post_id', to: 'posts#show'
end
