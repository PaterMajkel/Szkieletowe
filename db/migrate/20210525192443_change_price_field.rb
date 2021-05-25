class ChangePriceField < ActiveRecord::Migration[6.1]
  def change
    change_column :product_shops, :price, :decimal, :precision => 6, :scale => 2
  end
end
