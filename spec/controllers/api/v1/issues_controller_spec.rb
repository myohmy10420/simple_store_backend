RSpec.describe Api::V1::IssuesController, type: :controller do
  describe 'POST #create' do
    it 'post validated params' do
      before_count = Issue.count

      params = {
        issue: {
          content: '訊息內容'
        }
      }
      post :create, params: params

      expect(Issue.count).to eq(before_count + 1)
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq "application/json"
    end
  end
end
