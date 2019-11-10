class Product < ApplicationRecord
  has_many :line_items

  validates_presence_of :name, :content, :price, :inventory
  validates_uniqueness_of :name
  validates :price, :inventory, numericality: { only_integer: true, greater_than: 0 }
end
