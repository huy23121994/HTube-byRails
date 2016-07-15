Rails.application.routes.draw do

  root 'front_end#index'

  resources :categories, path: '/admin/categories'
  resources :tags, path: '/admin/tags'
  resources :posts, path: '/admin/posts'
  resources :users, path: '/admin/users', only: [:index, :create, :show, :edit, :update, :destroy]

  get '/sign-up' => 'users#new'
  get '/sign-in' => 'sessions#new'
  post '/sign-in' => 'sessions#create'
  get '/sign-out' => 'sessions#destroy'
  
  get 'post/:slug' => 'front_end#show_item'
  get 'category/:slug' => 'front_end#category'
  get 'tag/:slug' => 'front_end#tag'
  get 'admin' => 'back_end#index'

end
