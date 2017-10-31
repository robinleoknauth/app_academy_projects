Rails.application.routes.draw do


  get 'posts/show'

  get 'posts/new'

  get 'posts/create'

  get 'posts/edit'

  get 'posts/update'

  get 'posts/destroy'

  resources :users, only: [:create, :new]
  resource :session, only: [:create, :new, :destroy]
  resources :subs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
