class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy

  validates :last_name,  presence: true
  validates :first_name, presence: true
  validates :last_name_kana,  presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :first_name_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :phone_number, presence: true, format: {with: /\A\d{10}$|^\d{11}\z/}
  validates :post_code,  presence: true, format: {with: /\A\d{7}\z/}
  validates :address, presence: true

  def user_total_price
    sum = 0
    total_record = self.carts
    total_record.each do |record|
      price = record.product.unit_price
      sum += (price * 1.1).floor * record.units
    end
    return sum
  end

  def total_price_commission
    self.user_total_price + 800
  end

  def active_for_authentication?
    super && (self.status == true)
  end


end
