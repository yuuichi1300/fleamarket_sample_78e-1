Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root 'items#index'

  resources :credit_cards, only: [:new, :create, :show, :destroy] do
    collection do
       get 'purchase_complite'
    end
    member do
      get 'buy'
      post 'pay'
      
    end
  end

  resources :categories, only: [:index]
  resources :item_imgs
  resources :users, only: [:show]
  resources :items do
    member do
      get 'category_children'
      get 'category_grandchildren'
    end
  end
end
