class PublicController < ApplicationController
  def home
    @products = Product.all
  end
end
