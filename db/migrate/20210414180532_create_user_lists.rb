class CreateUserLists < ActiveRecord::Migration[6.1]
  def change
    create_table :user_lists do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
