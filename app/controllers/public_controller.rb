class PublicController < ApplicationController
  def home
    @products = Product.page(params[:page])
    @carousels = HomepageCarousel.all
  end
  def adminfun
    if(current_user.admin!=true)
      redirect_back fallback_location: '/'
    end
  end
end
