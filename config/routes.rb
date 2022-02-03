Rails.application.routes.draw do
  devise_for :users

  get 'home/index'
  root 'home#index'
  
  get '/@:username', to: 'users#show', as: :profile
  
  resources :users

  get 'upload', to: 'images#new'
  resources :images, only: [:index, :show, :create, :destroy]

  resources :save_images, only: [:index]
  
  resources :search, only: [:index]
 
  resources :likes, only: [:create, :destroy]

  resources :save_images, only: [:create, :destroy]

  resources :camera, only: [:new]
end
 