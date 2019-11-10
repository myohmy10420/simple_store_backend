class LineItem < ApplicationRecord
  belongs_to :order

  validates_presence_of :name, :amount, :price
  validates :amount, :price, numericality: { only_integer: true, greater_than: 0 }
end
