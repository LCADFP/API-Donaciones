class CreateDonacions < ActiveRecord::Migration[5.2]
  def change
    create_table :donacions do |t|
      t.string :nombre
      t.string :estado
      t.string :categoria
      t.integer :cantidad
      t.string :img
      t.string :descripcion
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
