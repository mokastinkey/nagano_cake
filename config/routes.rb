Rails.application.routes.draw do
  
  #####################customer側##################
  
  #devise
   devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions:      'public/sessions'
  }
  
  #address
  scope module: :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  
  #order
  scope module: :public do
    resources :orders, only: [:index, :create, :show, :new]
  end
  post '/orders/confirm' => 'public/orders#confirm', as: 'confirm_order'
  get '/orders/complete' => 'public/orders#complete', as: 'complete_order'
  
  #cart_item
  scope module: :public do
    resources :cart_items, only: [:index, :update, :destroy, :create]
  end
  delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all', as: 'destroy_all_cart_item'
  
  #customer
  scope module: :public do
    resource :customers, only: [:edit, :update]
  end
  get '/customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe_customer'
  patch '/customers/withdraw' => 'public/customers#withdraw', as: 'withdraw_customer'
  
  #item
  scope module: :public do
    resource :items, only: [:index, :show]
  end
  
  #homes
  get '/about' => 'public/homes#top', as: 'about_page'
  
  root to: 'public/homes#top'
  
  ###################################admin側########################
  
  #devise
  devise_for :admins, path: 'admin', controllers: {
    sessions:      'admin/sessions'
  }
  
  #order_details
  namespace :admin do
    resources :order_details, only: [:update]
  end
  
  #order
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  
  #customer
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  
  #genre
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  #item
  namespace :admin do
    resources :items, only: [:index, :new, :edit, :create, :show, :update]
  end
  
  #homes
  get '/admin' => 'admin/homes#top', as: 'admin_home'
  
end
