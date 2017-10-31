Rails.application.routes.draw do

  resources :users, only: [:create, :new]
  resource :session, only: [:create, :new, :destroy]
  resources :subs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
