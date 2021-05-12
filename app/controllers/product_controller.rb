class ProductController < ApplicationController

    def observed
       @products = current_user.products.order(:product_id).page(params[:page])
    end
    def index
      @products = Product.page(params[:page])
    end
end


