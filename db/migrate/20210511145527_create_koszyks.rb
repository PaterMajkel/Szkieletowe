class CreateKoszyks < ActiveRecord::Migration[6.1]
  def change
    create_table :koszyks do |t|
      t.string :Nazwa_Produktu
      t.string :Producent
      t.string :Kod_Produktu
      t.string :Cena

      t.timestamps
    end
  end
end
