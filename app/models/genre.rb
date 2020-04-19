class Genre < ApplicationRecord
  has_many :products

  enum display_status: {true: true, false: false}
  validates :genre ,presence: true
  validates :display_status, presence: true
end
