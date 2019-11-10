class Order < ApplicationRecord
  has_many :line_items

  validates_presence_of :user_name, :user_phone, :total_price
  validates :total_price, numericality: { only_integer: true, greater_than: 0 }
end
