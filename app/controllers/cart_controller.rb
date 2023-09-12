class CartController < ApplicationController
  def show
    @products = Product.all
  end
end
