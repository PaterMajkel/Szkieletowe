class ProductController < ApplicationController
  helper_method :sort_column, :sort_direction


    def observed
       @products = current_user.products.order(sort_column + " " + sort_direction).order(:product_id).page(params[:page])
    end
    def all
      @products = Product.order(sort_column + " " + sort_direction).page(params[:page])
    end

    def search
      @products = Product.where("lower(name) LIKE ? OR name LIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%").page(params[:page])
    end
  def search_by_category
    # @products = Product.all.category.where(id: params[:category_id])
    # to_show=[]
    #Product.all.each do |prod|
    # if prod.category
    # if prod.category.id==params[:product_category_id]
    #   to_show.append(prod)
    # end
    # end
    #end
    #@products=to_show.page(params[:page])
    #
    to_show=ProductCategory.where(category_id: params[:category_id])
    zmienna=[]
    to_show.each do |prod|
      zmienna << prod.product_id
    end
    @products=Product.where(id: zmienna).page(params[:page])
  end

    def show
      @products = Product.find(params[:id])
      @product_shops=@products.product_shop.order(date: :desc, price: :asc).first
    end
  # ponizej deklaruje sie domyslne sortowanie
  # teraz jest ustawione tak zeby sortowalo po dacie dodania produktu od najnowszego
    private
    def sort_column
      Product.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

end


