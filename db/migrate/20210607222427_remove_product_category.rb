class RemoveProductCategory < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :category
  end
end
