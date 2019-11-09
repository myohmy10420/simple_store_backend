require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:inventory) }
    it { should validate_uniqueness_of(:name) }
    it {
      should validate_numericality_of(:price).only_integer, greater_than: 0
    }
    it {
      should validate_numericality_of(:inventory).only_integer, greater_than: 0
    }
  end
end
