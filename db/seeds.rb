# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.create(email: 'adminuser@yopmail.com', password: 'password')

@product1 = Product.create(product_code: 'GR1', name: 'Green Tea', price: 3.11)
@product2 = Product.create(product_code: 'SR1', name: 'Strawberries', price: 5)
@product3 = Product.create(product_code: 'CF1', name: 'Coffee', price: 11.23)

@product1.product_offers.create(discount: 50, for_quantity: 2)
@product2.product_offers.create(discount: 10, for_quantity: 3)
@product3.product_offers.create(discount: 33.33, for_quantity: 3)
