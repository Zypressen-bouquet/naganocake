class CreateOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_products do |t|
      t.integer :order_id , null: false
      t.integer :product_id, null: false
      t.integer :working_status, null: false
      t.integer :units, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
