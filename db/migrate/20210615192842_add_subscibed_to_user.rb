class AddSubscibedToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :subbed, :bool, :default => false
  end
end
