require 'rails_helper'

RSpec.describe 'Cart', type: :request do
  let(:product) { create(:product) }
  let(:cart) { create(:cart) }

  describe 'GET #show' do
    it 'assigns a list of products with associated product offers in ascending order of creation' do
      product1 = create(:product, name: 'Product 1')
      product2 = create(:product, name: 'Product 2')
      product3 = create(:product, name: 'Product 3')

      create(:product_offer, product: product1)
      create(:product_offer, product: product2)
      create(:product_offer, product: product3)

      get '/'

      expect(response).to be_successful
      expect(assigns(:products)).to eq([product1, product2, product3])
      expect(assigns(:products)).to all(have_attributes(product_offers: be_present))
    end
  end

  describe 'POST #add' do
    it 'adds a product to the cart and responds with turbo_stream' do
      valid_params = { product_id: product.id, quantity: 1, commit: 'Add Item' }

      expect do
        post '/cart/add.turbo_stream', params: valid_params
      end.to change(CartsProduct, :count).by(1)

      cart_product = CartsProduct.last

      expect(cart_product.product).to eq(product)
      expect(cart_product.quantity).to eq(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #remove' do
    it 'removes a product from the cart and responds with turbo_stream' do
      cart_product = create(:carts_product, cart:, product:)

      expect do
        post '/cart/remove.turbo_stream', params: { product_id: cart_product.id }
      end.to change(CartsProduct, :count).by(-1)

      expect(CartsProduct.find_by(id: cart_product.id)).to be_nil
      expect(response).to have_http_status(:success)
    end
  end
end
