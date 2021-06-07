class Category < ApplicationRecord
  has_many :product_category, :dependent => :destroy
  has_many :products, :through=> :product_category
end
