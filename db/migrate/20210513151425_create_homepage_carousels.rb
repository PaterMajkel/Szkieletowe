class CreateHomepageCarousels < ActiveRecord::Migration[6.1]
  def change
    create_table :homepage_carousels do |t|
      t.string :image
      t.string :alt
      t.integer :duration
      t.text :heading
      t.text :description

      t.timestamps
    end
  end
end
