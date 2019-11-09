RSpec.describe Api::V1::ProductsController, type: :controller do
  describe 'GET #index' do
    before { get :index }
    it { expect(response).to have_http_status(:success) }
  end
end
