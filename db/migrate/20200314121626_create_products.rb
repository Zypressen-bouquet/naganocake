class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.integer :unit_price, null: false
      t.text :description
      t.text :image_id
      t.boolean :status, null: false
      t.timestamps
    end
  end
end
