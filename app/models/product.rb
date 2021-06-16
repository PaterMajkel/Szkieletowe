class Product < ApplicationRecord
  has_one :product_category, :dependent => :destroy
  has_one :category, :through=> :product_category
  has_many :user_product, :dependent => :destroy
  has_many :users, :through=> :user_product
  has_many :product_shop, :dependent => :destroy
  has_many :shops, :through=> :product_shop

  # scope :filter_by_category, ->(category_name) {where product_category_name: category_name}#nowe
  #scope :filter_by_starts_with, -> (name) { where("name like ?", "#{name}%")}#nowe
  # scope :filtr, -> (params){where(category_id:params)}
  paginates_per 6
end
