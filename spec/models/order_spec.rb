require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'association' do
    it { should have_many(:line_items) }
  end
end
