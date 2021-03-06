class Renamenames < ActiveRecord::Migration[6.1]
  def change
    rename_table :prodshops, :product_shops
    change_column :product_shops, :price, :decimal, :precision => 2
    change_column :users, :role, 'boolean USING CAST(role AS boolean)' # nwm o co chodzi ale wyjebywalo blad
    rename_column :users, :role, :admin
    rename_table :user_lists, :user_products
  end
end
