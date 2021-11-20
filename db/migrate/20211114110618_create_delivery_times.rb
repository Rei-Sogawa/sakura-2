class CreateDeliveryTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_times do |t|
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end
