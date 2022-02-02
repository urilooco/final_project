Rails.application.routes.draw do
  get 'camera/new'
  devise_for :users

  get 'home/index'
  root 'home#index'
  
  get '/@:username', to: 'users#show', as: :profile
  
  resources :users

  get 'upload', to: 'images#new'
  resources :images, only: [:index, :show, :create]

  resources :save_images, only: [:index]
  
  resources :search, only: [:index]
 
  resources :likes, only: [:create, :destroy]

  resources :save_images, only: [:create, :destroy]
end
 