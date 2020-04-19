class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_products, dependent: :destroy

   validates :name, presence: true
   validates :address, presence: true
   validates :post_code, presence: true
   validates :payment_method, presence: :true
   
  enum payment_method: {
    card: 1,
    transfar: 2
  }

  enum status: {
    waiting_payment: 1,
    confirm: 2,
    making: 3,
    waiting_shipping: 4,
    already_shipping: 5
  }

  def sum_units
    sum = 0
    self.ordered_products.each do |product|
      sum += product.units
    end
    return sum
  end

end
