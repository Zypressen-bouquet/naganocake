class OrderedProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum working_status: {
    cannot: 1,
    waiting: 2,
    making: 3,
    done: 4
  }


end
