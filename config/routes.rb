Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  resources :feedbacks
  get 'sessions/new'
  get 'users/new'
  root 'user_pages#home'
  #get 'administrator_pages/home'
  get  '/help',    to: 'user_pages#help'
  get  '/about',   to: 'user_pages#about'
  get  '/contact', to: 'user_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  #root 'home#home'
  #get 'home/home'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  resources :sensors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
