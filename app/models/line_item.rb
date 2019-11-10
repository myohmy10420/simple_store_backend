class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates_presence_of :name, :amount, :price
  validates :amount, :price, numericality: { only_integer: true, greater_than: 0 }
  validate :has_enough_product_inventory

  after_create :decrease_product_inventory

  def has_enough_product_inventory
    return if product.inventory >= amount
    errors.add :amount, 'is beyond product inventory'
  end

  def decrease_product_inventory
    product.update(inventory: product.inventory - amount)
  end
end
