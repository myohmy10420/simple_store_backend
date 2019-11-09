class Api::V1::ProductsController < Api::V1::BaseController
  def index
    products = Product.all
    render status: 200, json: { products: products }
  end
end
