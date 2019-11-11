class Api::V1::OrdersController < Api::V1::BaseController
  def create
    errors = []
    begin
      ActiveRecord::Base.transaction do
        order = Order.create!(order_params)
        cart_items = params[:cart_items]

        cart_items.each do |item_params|
          line_item = LineItem.new(item_params.permit(:name, :amount, :price))
          line_item.order_id = order.id
          line_item.product_id = item_params[:id].to_i
          line_item.save!
        end
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
end
