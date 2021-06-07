class Product < ApplicationRecord
  has_many :product_category, :dependent => :destroy
  has_many :categories, :through=> :product_category
  has_many :user_product, :dependent => :destroy
  has_many :users, :through=> :user_product
  has_many :product_shop, :dependent => :destroy
  has_many :shops, :through=> :product_shop
  paginates_per 6
end
