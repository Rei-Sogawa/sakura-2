class CreateProductVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :product_versions do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.boolean :published
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
