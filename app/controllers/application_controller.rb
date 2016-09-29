class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end

  def get_cart
    if session[:cart_id]
      cart = Cart.find( session[:cart_id] )
    else
      cart = Cart.create!
      session[:cart_id] = cart.id
    end

    return cart
  end

  def current_cart
    unless @current_cart
      @current_cart = get_cart
    end

    return @current_cart
  end

  helper_method :current_cart
  
end
