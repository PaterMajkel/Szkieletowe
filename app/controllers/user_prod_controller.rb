class UserProdController < ApplicationController
  def index
    @userprod=UserProduct.all
  end

  def create
    @userprod=UserProduct.new(user_id, product_id)
  end

  def delete
  end
end
