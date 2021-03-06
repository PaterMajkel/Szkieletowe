class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates_uniqueness_of :email
  has_many :user_product, :dependent => :destroy
  has_many :products, :through=> :user_product
  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :web_notification, :dependent => :destroy

  after_initialize :default_values, :default_login

  private
  def default_values
      self.admin ||= false
  end
  def default_login
   indeks=self.email.index('@')
   indeks=indeks.to_i-1
   logg = self.email[0..indeks]
   self.login ||=logg
  end
  #enum role: [:admin,:user]
end
