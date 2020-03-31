class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :model
      t.float :price
      t.string :stone
      t.string :image
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
