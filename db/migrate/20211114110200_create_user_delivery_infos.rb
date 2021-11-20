class CreateUserDeliveryInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_delivery_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :postal_code

      t.timestamps
    end
  end
end
