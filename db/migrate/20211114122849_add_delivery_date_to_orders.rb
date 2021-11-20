class AddDeliveryDateToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :delivery_date, :date
  end
end
