Rails.application.routes.draw do
  get 'product/index'
  get 'product/observed'
  get 'product/all'
  get 'home/about'
  #resources :product
  get 'product/observed'
  #get 'public/home'
  root 'public#home'
  get "/public", to: "public#home"
  devise_for :users


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
