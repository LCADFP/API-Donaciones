class AddNombresToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nombres, :string, null: false
    add_column :users, :apellidos, :string, null: false
    add_column :users, :fecha_nac, :date, null: false
    add_column :users, :direccion, :string, null: false
    add_column :users, :telefono, :string, null: false
  end
end
