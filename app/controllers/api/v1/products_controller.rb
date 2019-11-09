module Api
  module V1
    class ProductsController < ActionController::Base
      def index
        # products = Product.all
        render status: 200, json: { status: 'ok' }
      end
    end
  end
end
