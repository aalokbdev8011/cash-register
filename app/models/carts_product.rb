class CartsProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }

  def total
    return product.price * quantity unless ProductOffer.where(product:).where('for_quantity <= ?', quantity).exists?

    discounts = ProductOffer.where(product:).where('for_quantity <= ?', quantity).pluck(:discount)
    discounts.map { |discount| product.price * (discount / 100) }.min.round(2) * quantity
  end
end
