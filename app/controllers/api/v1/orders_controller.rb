class Api::V1::OrdersController < Api::V1::BaseController
  def create
    errors = []
    begin
      ActiveRecord::Base.transaction do
        order = Order.create!(order_params)
        create_cart_items_of_order(params[:cart_items], order)
      end
    rescue => error
      errors << error.message
    end

    if errors.blank?
      OrderMailer.success_notify.deliver_later!
      render json: { status: 'ok' }, status: 200
    else
      render json: { errors: errors }, status: 400
    end
  end

  private

  def order_params
    ActionController::Parameters.new({
      user_name: params[:name],
      user_phone: params[:phone],
      total_price: params[:total_price]
    }).permit(:user_name, :user_phone, :total_price)
  end

  def create_cart_items_of_order(cart_items, order)
    cart_items.each do |item|
      product_id = item[:id].to_i

      line_item = LineItem.new(item.permit(:name, :amount, :price))
      line_item.order_id = order.id
      line_item.product_id = product_id
      line_item.save!
    end
  end
end
