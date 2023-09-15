require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'associations' do
    it { should have_many(:carts_products).dependent(:destroy) }
    it { should have_many(:products).through(:carts_products) }
  end

  describe 'total' do
    let(:cart) { create(:cart) }
    let(:product1) { create(:product, price: 10) }
    let(:product2) { create(:product, price: 15) }

    let!(:carts_product1) { create(:carts_product, cart:, product: product1, quantity: 2) }
    let!(:carts_product2) { create(:carts_product, cart:, product: product2, quantity: 3) }

    it 'calculates the total cost of all cart products' do
      total = cart.total

      expect(total).to eq((product1.price * 2) + (product2.price * 3))
    end
  end
end
