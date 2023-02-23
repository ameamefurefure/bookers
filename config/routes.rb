Rails.application.routes.draw do
  # get 'homes/top' => 'homes#top'
  get "/" => "homes#top"

  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  resources :books
  post 'books' => 'books#create'
  get 'books/:id' => 'books#show'
  get 'books/:id/edit' => 'books#edit'
  patch 'books/:id' => 'books#update', as: 'update_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
