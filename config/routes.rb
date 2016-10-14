Rails.application.routes.draw do

  root 'front_end#index'

  namespace :admin do
    resources :categories, path: 'categories'
    resources :tags, path: 'tags'
    resources :posts, path: 'posts'
    resources :users, path: 'users', only: [:index, :create, :show, :edit, :update, :destroy]
  end

  get '/sign-up' => 'users#new'
  get '/sign-in' => 'sessions#new'
  post '/sign-in' => 'sessions#create'
  get '/sign-out' => 'sessions#destroy'
  
  get 'post/:slug' => 'front_end#show_item'
  get 'category/:slug' => 'front_end#category'
  get 'tag/:slug' => 'front_end#tag'
  get 'admin' => 'back_end#index'

end
