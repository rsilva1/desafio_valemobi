Rails.application.routes.draw do
  root to: 'public#index'

  # auth routes
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  devise_scope :admin do
  	get 'admin', to: 'devise/sessions#new'
  end
  devise_for :admins

  get 'admin_panel', to: 'admin#index', as: :admin_root
  resources :items, only: [:index, :update, :create, :destroy]
  resources :deals, only: [:index, :create, :destroy]
end
