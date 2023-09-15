FactoryBot.define do
  factory :carts_product do
    product { create(:product) }
    cart { create(:cart) }
    quantity { 1 }
  end
end
