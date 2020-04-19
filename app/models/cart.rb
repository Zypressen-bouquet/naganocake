class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :units, presence: true
    def current_cart
      current_user.carts
    end

    def total_price
      sum = 0
      total_record = current_user.carts
      total_record.each do |record|
        sum += record.price * record.units
      end
    end
end
