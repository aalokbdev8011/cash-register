class Product < ApplicationRecord
  validates :product_code, :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }
end
