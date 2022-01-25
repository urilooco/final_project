Rails.application.routes.draw do
  devise_for :users

  get 'home/index'
  root 'home#index'

  # get 'profile', to: 'users#edit'
  # get 'profile', to: 'users#show'
  get '/@:username', to: 'users#show', as: :profile
  # get '/:username', to: 'users#show', as: :profile
  resources :users

  get 'upload', to: 'images#new'
  resources :images, only: [:index, :show, :create]

  get 'search', to: 'users#search'

  resources :likes, only: [:create, :destroy]
end
 