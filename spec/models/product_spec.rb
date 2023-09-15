require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:product_code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(1) }
  end

  describe 'associations' do
    it { should have_many(:carts_products).dependent(:destroy) }
    it { should have_many(:carts).through(:carts_products) }
    it { should have_many(:order_products).dependent(:destroy) }
    it { should have_many(:orders).through(:order_products) }
    it { should have_many(:product_offers).dependent(:destroy) }
  end
end
