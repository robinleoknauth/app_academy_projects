Rails.application.routes.draw do
  resources :users
  resource :session, only: [:new, :create, :destroy]

  resources :albums, only: [:show, :create, :edit, :update, :destroy]
  resources :tracks, only: [:show, :create, :edit, :update, :destroy]
  resources :bands, only: [:index, :show, :create, :edit, :update, :destroy]
end
