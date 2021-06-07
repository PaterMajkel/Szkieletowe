Rails.application.routes.draw do

  get 'category/delete'
  devise_scope :user do
    get 'after_signup_page', to: 'devise/registrations#after_signup'
  end
  devise_for :users , controllers: {registrations: "users/registrations", confirmations: "users/confirmations"}
  get 'userproduct/create'
  get 'userproduct/delete'
  get 'userproduct/findID'
  #get 'product/show'
  get 'product/observed'
  get 'product/all'
  get 'product/index'
  get 'home/about'
  get 'productshop/create'
  get 'productshop/getData'
  resources :productshop
  resources :userproduct
  resources :product
  resources :shop
  get 'product/observed'
  #nowy
  get 'search', to: "product#search"
  #get 'public/home'
  root 'public#home'
  get "/public", to: "public#home"
  #devise_for :users
  resources :contacts, only: [:new, :create]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
