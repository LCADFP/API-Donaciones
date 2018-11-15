class CreateEstados < ActiveRecord::Migration[5.2]
  def change
    create_table :estados do |t|
      t.string :name, null: false
      

      t.timestamps
    end
    add_index :estados, :name, unique: true
  end
end
