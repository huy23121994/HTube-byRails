Rails.application.routes.draw do

  root 'front_end#index'

  resources :categories, path: '/admin/categories'
  resources :tags, path: '/admin/tags'
  resources :posts, path: '/admin/posts'
  resources :users, path: '/admin/users', only: [:index, :create, :show, :edit, :update, :destroy]

  get 'post/:id' => 'front_end#show_item'
  get 'admin' => 'back_end#index'

end
