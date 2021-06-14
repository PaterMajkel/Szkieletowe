class ProductshopController < ApplicationController
  def create
    ProductShop.scraper
    redirect_back fallback_location: '/'

  end
end
