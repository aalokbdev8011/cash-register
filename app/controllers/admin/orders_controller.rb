module Admin
  class OrdersController < AdminController
    skip_before_action :authenticate_user!, only: %i[create]
    def index
      @orders = Order.includes(order_products: :product).order(created_at: :asc).all
    end

    def create
      cart = Cart.find(params[:cart])

      order = Order.create!(total_amount: cart.total)
      cart.carts_products.each do |cart_product|
        order.order_products.create!(product_id: cart_product.product_id, quantity: cart_product.quantity)
      end
      reset_cart(cart)

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace('cart', partial: 'cart/cart', locals: { cart: @cart }),
            turbo_stream.prepend('cart', html: 'Order places successfully!'),
          ]
        end
      end
    end

    private

    def reset_cart(cart)
      cart.destroy
      session[:cart_id] = initialize_cart
    end
  end
end
