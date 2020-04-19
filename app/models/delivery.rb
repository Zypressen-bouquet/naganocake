class Delivery < ApplicationRecord
    belongs_to :user
	validates :name, presence: true
	validates :address, presence: true
	validates :post_code, presence: true


  # orderで住所をつなげて表示するために作成
  def display_address
    self.post_code + " " + self.address + " " + self.name
  end

end
