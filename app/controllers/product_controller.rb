class ProductController < ApplicationController

    def observed
       @products = current_user.products.order(:product_id).page(params[:page])
    end

    def all
      @products = Product.page(params[:page])
    end

    def search
      @products = Product.where("lower(name) LIKE ? OR name LIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%").page(params[:page])
    end

    def show
      @products = Product.find(params[:id])
    end



end


