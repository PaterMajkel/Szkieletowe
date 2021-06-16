class UserproductController < ApplicationController
  def create
      @userproducts=UserProduct.new(upro_params)
      @userproducts.save

    redirect_to product_all_path
  end

  def findID(user_id,product_id)
    id=UserProduct.find(user_id,product_id)
    if(:id.nil?)
      return 0
    end
    return :id

    redirect_to request.referrer
  end

  def search_by_category

    to_show=ProductCategory.where(category_id: params[:category_id])
    zmienna=[]
    to_show.each do |prod|
      zmienna << prod.product_id
    end
    @products=UserProduct.where(user_id: current_user.id, product_id: zmienna)
  end

  def delete
    @userproduct=UserProduct.find_by(user_id: current_user.id, product_id: params[:product_id])
    if @userproduct.present?
      @userproduct.destroy
      end
    redirect_to request.referrer
  end

  private
  def upro_params
    params.permit(:product_id).merge(user_id: current_user.id)
  end
end
