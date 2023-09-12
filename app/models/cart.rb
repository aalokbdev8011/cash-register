class Cart < ApplicationRecord
  has_many :carts_products
  has_many :products, through: :carts_products

  def total
    carts_products.to_a.sum { |cart_product| cart_product.total }
  end
end
