Rails.application.routes.draw do
  
  devise_for :admins, path: 'admin', controllers: {
    sessions:      'admin/sessions'
  }
  
  devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions:      'public/sessions'
  }
  
  root to: 'public#homes'
end
