Rails.application.routes.draw do
  devise_for :users

  get 'home/index'
  root 'home#index'
  
  get '/@:username', to: 'users#show', as: :profile
  
  resources :users

  get 'upload', to: 'images#new'
  resources :images, only: [:index, :show, :create]

  resources :save_images, only: [:index]
  get '/save_images/saved', to: 'save_images#index', as: 'saved'

  get 'search', to: 'users#search'
 
  resources :likes, only: [:create, :destroy]

  resources :save_images, only: [:create, :destroy]
end
 