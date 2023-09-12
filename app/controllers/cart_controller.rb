class CartController < ApplicationController
  before_action :initialize_cart

  def show
    @products = Product.all
  end

  def add
    @product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    current_cart_product = @cart.carts_products.find_by(product_id: @product.id)
    if current_cart_product && quantity.positive?
      quantity += current_cart_product.quantity if params[:commit] == 'Add Item'

      current_cart_product.update(quantity:)
    else
      @cart.carts_products.create!(product_id: @product.id, quantity:)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace('cart', partial: 'cart/cart', locals: { cart: @cart }),
          turbo_stream.replace("product_#{@product.id}", partial: 'product_card', locals: { product: @product }),
        ]
      end
    end
  end

  def remove
    CartsProduct.find_by(id: params[:product_id]).destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace('cart', partial: 'cart/cart', locals: { cart: @cart }),
        ]
      end
    end
  end

  private

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    return unless @cart.blank?

    @cart = Cart.create!
    session[:cart_id] = @cart.id
  end
end
