RSpec.describe Product, type: :model do
  describe 'association' do
    it { should have_many(:line_items) }
  end
end
