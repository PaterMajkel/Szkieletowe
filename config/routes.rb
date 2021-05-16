Rails.application.routes.draw do
  get 'userproduct/create'
  get 'userproduct/delete'
  get 'userproduct/findID'
  #get 'product/show'
  get 'product/observed'
  get 'product/all'
  get 'home/about'
  resources :userproduct
  resources :product
  get 'product/observed'
  #nowy
  get 'search', to: "product#search"
  #get 'public/home'
  root 'public#home'
  get "/public", to: "public#home"
  devise_for :users


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
