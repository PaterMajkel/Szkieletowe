Rails.application.routes.draw do

  get 'webnotifications/index'
  get 'category/delete'
  devise_scope :user do
    get 'after_signup_page', to: 'devise/registrations#after_signup'
  end
  devise_for :users , controllers: {registrations: "users/registrations", confirmations: "users/confirmations"}
  get 'userproduct/create'
  get 'userproduct/delete'
  get 'userproduct/findID'
  get 'product/show'
  get 'product/observed'
  get 'product/all'
  #get 'product/index'
  get 'home/about'
  get 'productshop/create'
  get 'productshop/getData'
  resources :productshop
  resources :userproduct
  resources :product
  resources :shop
  resources :category
  resources :webnotifications
  get 'public/adminfun'
  get 'product/observed'
  #nowy
  get 'search', to: "product#search"
  get 'search_by_category', to: "product#search_by_category"
  get 'search_by_category', to: "userproduct#search_by_category"
  #get 'public/home'
  root 'public#home'
  get "/public", to: "public#home"
  get 'settings/unsubscribe'
  get 'settings/update'
  #devise_for :users
  resources :contacts, only: [:new, :create]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/404' , to: 'errors#not_found'
  get '/422' , to: 'errors#unacceptable'
  get '/500' , to: 'errors#server_error'
end
