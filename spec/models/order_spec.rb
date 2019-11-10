require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'association' do
    it { should have_many(:line_items) }
  end

  describe 'validations' do
    it 'presence_of' do
      should validate_presence_of(:user_name)
      should validate_presence_of(:user_phone)
      should validate_presence_of(:total_price)
    end

    it 'numericality_of' do
      should validate_numericality_of(:total_price).only_integer.is_greater_than(0)
    end
  end
end
