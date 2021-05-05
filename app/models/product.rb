class Product < ApplicationRecord
  has_many :users, :through=> :user_product
  has_and_belongs_to_many :shops
end