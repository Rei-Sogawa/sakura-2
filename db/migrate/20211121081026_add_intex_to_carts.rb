class AddIntexToCarts < ActiveRecord::Migration[6.1]
  def change
    remove_index :carts, :user_id
    add_index :carts, :user_id, unique: true
  end
end
