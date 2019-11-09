class Api::V1::ProductsController < Api::V1::BaseController
  def index
    products = Product.all
    render json: { products: products }, status: 200
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: { stasut: 'ok' }, status: 200
    else
      render json: { errors: product.errors.full_messages }, status: 400
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :content, :price, :inventory)
  end
end
