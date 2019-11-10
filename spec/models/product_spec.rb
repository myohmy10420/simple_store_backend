RSpec.describe Product, type: :model do
  describe 'validations' do
    it 'presence_of' do
      should validate_presence_of(:name)
      should validate_presence_of(:content)
      should validate_presence_of(:price)
      should validate_presence_of(:inventory)
      should validate_uniqueness_of(:name)
    end

    it 'numericality_of' do
      should validate_numericality_of(:price).only_integer.is_greater_than(0)
      should validate_numericality_of(:inventory).only_integer.is_greater_than(0)
    end
  end
end
