RSpec.describe Api::V1::OrdersController, type: :controller do
  describe 'POST #create' do
    it 'increase record count and correct associations' do
      before_orders_count = Order.count
      before_line_items_count = LineItem.count

      product = FactoryBot.create(:product)
      product_hash = JSON.parse(product.to_json)
      product_hash['amount'] = 1

      totalPrice = product.price

      params = {
        name: '陳小春',
        phone: '0932313520',
        total_price: 37000,
        cart_items: [
          product_hash
        ]
      }
      post :create, params: params

      expect(Order.count).to eq(before_orders_count + 1)
      expect(LineItem.count).to eq(before_line_items_count + 1)
      expect(LineItem.last.order_id).to eq(Order.last.id)
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq 'application/json'
    end

    it 'amount cannot beyond inventory' do
      before_orders_count = Order.count
      before_line_items_count = LineItem.count

      product = FactoryBot.create(:product)
      product_hash = JSON.parse(product.to_json)
      product_hash['amount'] = product.inventory + 1

      totalPrice = product.price

      params = {
        name: '陳小春',
        phone: '0932313520',
        totalPrice: 37000,
        cartItems: [
          product_hash
        ]
      }
      post :create, params: params

      expect { raise "Amount is beyond product inventory" }.to raise_error(RuntimeError, "Amount is beyond product inventory")

      expect(Order.count).to eq(before_orders_count)
      expect(LineItem.count).to eq(before_line_items_count)
      expect(response).to have_http_status(400)
      expect(response.content_type).to eq 'application/json'
    end
  end
end
