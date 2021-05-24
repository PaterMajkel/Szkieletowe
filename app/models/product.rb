class Product < ApplicationRecord
  has_many :user_product
  has_many :users, :through=> :user_product
  has_many :product_shops
  has_many :shops, :through=> :product_shop
  paginates_per 6
end
