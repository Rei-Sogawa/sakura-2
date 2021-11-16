class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :delivery_time, null: false, foreign_key: true
      t.integer :sub_total_price
      t.integer :cash_on_delivery
      t.integer :postage
      t.integer :total_price

      t.timestamps
    end
  end
end
