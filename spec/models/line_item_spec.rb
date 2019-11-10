require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe 'association' do
    it do
      should belong_to(:order)
      should belong_to(:product)
    end
  end

  describe 'after_create' do
    it 'decrease_product_inventory' do
      product = FactoryBot.create(:product)
      order = FactoryBot.create(:order)
      line_item = FactoryBot.create(:line_item, {
        order_id: order.id,
        product_id: product.id
      })

      before_inventory = product.inventory
      item_amount = line_item.amount

      expect(product.reload.inventory).to eq(before_inventory - item_amount)
    end
  end
end
