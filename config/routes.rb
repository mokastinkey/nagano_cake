Rails.application.routes.draw do
  
  devise_for :admins, path: 'admin', controllers: {
    sessions:      'admin/sessions'
  }
  
  devise_for :customers, path: 'public', controllers: {
    registrations: 'customers/registrations',
    sessions:      'customers/sessions'
  }
  
  root to: 'public#homes'
end
