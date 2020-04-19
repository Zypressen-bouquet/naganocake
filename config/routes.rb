Rails.application.routes.draw do
  # ECサイトのrouting
  root 'homes#top'
  devise_for :admins
  devise_for :users

  resources :products, only: [:index,:show]
  resources :genres, only: [:index] do
    resources :products, only: [:index]
  end
  resources :carts, only: [:index,:edit,:update,:destroy,:create] do
    collection do
      delete 'destroy_all'
    end
  end
  resources :orders, only: [:index,:new,:create,:show] do
    collection do
      get 'input'
      get 'complete'
    end
  end
  resources :users, only: [:show,:edit,:update] do
    member do
      get 'quit'
      put 'user_quit'
    end
  end
  resources :deliveries, only: [:index,:create,:destroy,:edit,:update]
  namespace :admin do
    resources :carts
    resources :orders do
      resources :ordered_products, only: [:update]
    end
  end

  # Adminのrouting
  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :genres, only: [:index,:edit,:create,:update]
    resources :orders, only: [:index,:show,:update]
    resources :ordered_products, only: [:update]
    resources :products, only: [:index,:new,:create,:show,:edit,:update]
    resources :users, only: [:index,:show,:edit,:update]
  end

end
