class Shop < ApplicationRecord
  has_many :product_shop
  has_many :products, :through => :product_shop

end
