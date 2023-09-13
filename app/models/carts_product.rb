class CartsProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }

  def total
    return product.price * quantity unless ProductOffer.where(product:).where('for_quantity <= ?', quantity).exists?

    discounts = ProductOffer.where(product:).where('for_quantity <= ?', quantity).pluck(:discount)
    final_discounted_price = discounts.map do |discount|
      product.price * (1 - (1 * (discount / 100)))
    end.min

    (final_discounted_price * quantity).round(2)
  end
end
