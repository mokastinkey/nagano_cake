Rails.application.routes.draw do
  
  namespace :admin do
    resources :order_details, only: [:update]
  end
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    resources :items, only: [:index, :new, :edit, :create, :show, :update]
  end
  
  get '/admin' => 'admin/homes#top', as: 'admin_home'
  
  devise_for :admins, path: 'admin', controllers: {
    sessions:      'admin/sessions'
  }
  
  devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions:      'public/sessions'
  }
  
  root to: 'public#homes'
end
