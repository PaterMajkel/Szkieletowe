class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_uniqueness_of :login
  validates_uniqueness_of :email
  has_many :products, :through=> :user_product
  #enum role: [:admin,:user]
end
