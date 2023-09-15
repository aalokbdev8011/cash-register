require 'rails_helper'

RSpec.describe 'Admin::Orders', type: :request do
  describe 'GET #index' do
    it 'should allow user to view the list of orders' do
      user = create(:user)
      sign_in user

      order1 = create(:order, created_at: 2.days.ago)
      order2 = create(:order, created_at: 1.day.ago)
      order3 = create(:order, created_at: Time.now)

      get '/orders'
      expect(response.status).to eq(200)
      expect(assigns(:orders)).to eq([order1, order2, order3])
    end

    it 'should not list orders if the user is not logged in' do
      get '/orders'
      expect(response.status).to eq(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'POST #create' do
    it 'creates an order' do
      cart = create(:cart)
      product1 = create(:product, price: 20)
      product2 = create(:product, price: 10)
      create(:carts_product, cart:, product: product1, quantity: 2)
      create(:carts_product, cart:, product: product2, quantity: 1)

      expect do
        post '/orders.turbo_stream', params: { cart: cart.id }
      end.to change(Order, :count).by(1)

      order = Order.last
      expect(order.total_amount).to eq(50)

      expect(response).to have_http_status(:success)
      expect(response).to render_template('cart/_cart')
      expect(response).to render_template('shared/_alert')
    end
  end
end
