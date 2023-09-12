FactoryBot.define do
  factory :product_offer do
    product { nil }
    discount { "9.99" }
    for_quantity { 1 }
  end
end
