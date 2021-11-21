class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :postage, null: false
      t.integer :cash_on_delivery_fee, null: false
      t.date :delivery_date, null: false
      t.string :delivery_time, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.text :address, null: false
      t.string :postal_code, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
