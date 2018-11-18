class AddEstadosIdToDonacions < ActiveRecord::Migration[5.2]
  def change
    add_reference :donacions, :estados, foreign_key: true, null: false, default: 1;
  end
end
