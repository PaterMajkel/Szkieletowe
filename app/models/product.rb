class Product < ApplicationRecord
  has_many :user_product, :dependent => :destroy
  has_many :users, :through=> :user_product
  has_many :product_shop, :dependent => :destroy
  has_many :shops, :through=> :product_shop
  has_many :category_product, :dependent => :destroy
  has_many :categories, :through => :category_products
  paginates_per 6
end
