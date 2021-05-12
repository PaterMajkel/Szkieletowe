class UserproductController < ApplicationController
  def create
    @userproducts=UserProduct.new(upro_params)
    @userproducts.save
    redirect_to product_all_path
  end

  def find
    @userproducts.find(upro_params)
    
  end

  def delete
    @userproduct=UserProduct.find(param[:id])
    @userproduct.destroy
  end

  private
  def upro_params
    params.permit(:product_id).merge(user_id: current_user.id)
  end
end
