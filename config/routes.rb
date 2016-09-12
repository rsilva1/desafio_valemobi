Rails.application.routes.draw do
  # auth routes
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  devise_scope :admin do
  	get 'admin', to: 'devise/sessions#new'
  end
  devise_for :admins

  # other routes
  root to: 'public#index'
  get 'admin_panel', to: 'admin#index', as: :admin_root
end
