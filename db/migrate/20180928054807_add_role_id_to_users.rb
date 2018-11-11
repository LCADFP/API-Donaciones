class AddRoleIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :role, foreign_key: true, null: false
  end
end
