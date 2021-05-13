class PublicController < ApplicationController
  def home
    @products = Product.page(params[:page])
    @carousels = HomepageCarousel.all
  end
end
