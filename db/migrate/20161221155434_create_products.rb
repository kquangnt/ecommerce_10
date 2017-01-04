class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :price
      t.string :deleted_at
      t.float :avg_rating
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
