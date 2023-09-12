class Product < ApplicationRecord
  validates :product_code, :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }

  has_many :carts_products, dependent: :destroy
  has_many :carts, through: :carts_products

  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products

  has_many :product_offers
end
