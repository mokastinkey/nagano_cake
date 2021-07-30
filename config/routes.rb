Rails.application.routes.draw do
  
  #####################public側##################
  
  #devise
   devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions:      'public/sessions'
  }
  
  scope module: :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy] #address
    resources :orders, only: [:index, :create, :show, :new] #order
    resources :cart_items, only: [:index, :update, :destroy, :create] #cart_item
    resource :customers, only: [:edit, :update] #customer
    resources :items, only: [:index, :show] #item
  end
  
  #order
  post '/orders/confirm' => 'public/orders#confirm', as: 'confirm_order'
  get '/orders/complete' => 'public/orders#complete', as: 'complete_order'
  
  #cart_item
  delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all', as: 'destroy_all_cart_item'
  
  #customer
  get '/customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe_customer'
  patch '/customers/withdraw' => 'public/customers#withdraw', as: 'withdraw_customer'
  get '/customers/my_page' => 'public/customers#show', as: 'customer_mypage'
  
  #homes
  get '/about' => 'public/homes#about', as: 'about_page'
  
  #root
  root to: 'public/homes#top'
  
  ###################################admin側########################
  
  #devise
  devise_for :admins, path: 'admin', controllers: {
    sessions:      'admin/sessions'
  }
  
  namespace :admin do
    resources :order_details, only: [:update] #order_details
    resources :orders, only: [:show, :update] #order
    resources :customers, only: [:index, :show, :edit, :update] #customer
    resources :genres, only: [:index, :create, :edit, :update] #genre
    resources :items, only: [:index, :new, :edit, :create, :show, :update] #item
  end
  
  #homes
  get '/admin' => 'admin/homes#top', as: 'admin_home'
  
end
