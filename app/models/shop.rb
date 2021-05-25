class Shop < ApplicationRecord
  has_many :product_shop, :dependent => :destroy
  has_many :products, :through => :product_shop

end
