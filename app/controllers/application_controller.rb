class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    admin_orders_path(resource) || super
  end

  def after_sign_out_path_for(resource)
    root_path(resource) || super
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    return unless @cart.blank?

    @cart = Cart.create!
    session[:cart_id] = @cart.id
  end
end
