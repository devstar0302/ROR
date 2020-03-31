class CreateColors < ActiveRecord::Migration[5.0]
  def change
    create_table :colors do |t|
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
