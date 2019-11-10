require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe 'association' do
    it { should belong_to(:order) }
  end

  describe 'validations' do
    it 'presence_of' do
      should validate_presence_of(:name)
      should validate_presence_of(:amount)
      should validate_presence_of(:price)
    end

    it 'numericality_of' do
      should validate_numericality_of(:amount).only_integer.is_greater_than(0)
      should validate_numericality_of(:price).only_integer.is_greater_than(0)
    end
  end
end
