class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :image
      t.references :religion, foreign_key: true

      t.timestamps
    end
  end
end
