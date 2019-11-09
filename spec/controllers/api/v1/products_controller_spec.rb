RSpec.describe Api::V1::ProductsController, type: :controller do
  describe 'GET #index' do
    before { get :index }
    it { expect(response).to have_http_status(:success) }
  end

  describe 'GET #show' do
    it 'has record' do
      product = FactoryBot.create(:product)
      get :show, params: { id: product.id }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq "application/json"
    end

    it 'record not found' do
      get :show, params: { id: 100 }

      expect(response).to have_http_status(404)
      expect(response.content_type).to eq "application/json"
    end
  end

  describe 'POST #create' do
    it 'post validated params' do
      before_count = Product.count

      params = {
        product: {
          name: '商品',
          content: '商品內文',
          inventory: 1,
          price: 100
        }
      }
      post :create, params: params

      expect(Product.count).to eq(before_count + 1)
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq "application/json"
    end

    it 'post invalidated params' do
      before_count = Product.count

      params = {
        product: {
          name: nil,
          content: nil,
          inventory: 'not integer',
          price: 'not integer'
        }
      }
      post :create, params: params

      expect(Product.count).to eq(before_count)
      expect(response).to have_http_status(400)
      expect(response.content_type).to eq "application/json"
    end
  end
end
