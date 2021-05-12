Rails.application.routes.draw do
  get 'home/about'
  #get 'public/home'
  root 'public#home'
  get "/public", to: "public#home"
  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
