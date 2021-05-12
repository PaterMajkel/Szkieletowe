class ProductController < ApplicationController
  before_action :authenticate_user!
  def observed
    @products = current_user.products.order(:product_id)
  end
  def show
    @products = Product.all
  end
end
