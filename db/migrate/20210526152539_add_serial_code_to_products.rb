class AddSerialCodeToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :serial_code, :string
  end
end
