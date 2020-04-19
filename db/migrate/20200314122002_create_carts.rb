class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :user_id, null: false
      t.integer :product_id, null: false
      t.integer :units, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
