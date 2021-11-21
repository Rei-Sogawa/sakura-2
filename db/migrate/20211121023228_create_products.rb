class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.boolean :published, null: false, default: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
