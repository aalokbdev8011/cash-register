require 'rails_helper'

RSpec.describe CartsProduct, type: :model do
  describe 'associations' do
    it { should belong_to(:product) }
    it { should belong_to(:cart) }
  end

  describe 'validations' do
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity).is_greater_than_or_equal_to(1) }
  end

  describe '#total' do
    let(:product) { create(:product) }

    it 'calculates the total cost of the cart product with discounts' do
      cart_product = create(:carts_product, quantity: 5, product:)
      product_offer = create(:product_offer, product:, for_quantity: 5, discount: 10)

      total = cart_product.total
      final_discounted_price = product.price * (1 - (1 * (product_offer.discount / 100)))

      expected_total = (final_discounted_price * 5).round(2)
      expect(total).to eq(expected_total)
    end

    it 'calculates the total cost of the cart product without discounts' do
      cart_product = create(:carts_product, quantity: 3, product:)

      total = cart_product.total

      expected_total = (product.price * 3).round(2)
      expect(total).to eq(expected_total)
    end
  end
end
