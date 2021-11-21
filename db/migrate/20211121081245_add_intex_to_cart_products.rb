class AddIntexToCartProducts < ActiveRecord::Migration[6.1]
  def change
    add_index :cart_products, %i[cart_id product_id], unique: true
  end
end
