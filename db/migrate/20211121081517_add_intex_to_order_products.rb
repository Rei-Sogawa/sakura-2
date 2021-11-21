class AddIntexToOrderProducts < ActiveRecord::Migration[6.1]
  def change
    add_index :order_products, %i[order_id product_id], unique: true
  end
end
