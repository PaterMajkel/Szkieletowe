class CreateProdshops < ActiveRecord::Migration[6.1]
  def change
    create_table :prodshops do |t|
      t.integer :product_id
      t.integer :shop_id
      t.decimal :price
      t.datetime :date

      t.timestamps
    end
  end
end
