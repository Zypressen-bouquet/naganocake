class RemovePriceFromCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :price, :integer
  end
end
