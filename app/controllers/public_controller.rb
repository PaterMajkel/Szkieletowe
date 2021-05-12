class PublicController < ApplicationController
  def home
    @products = Product.page(params[:page])
  end
end
