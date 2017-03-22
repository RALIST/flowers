class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_cart, :search_params




  private
    def current_cart
      if current_user
        unless current_user.cart.blank?
          @cart = current_user.cart
        else
          @cart = Cart.create
          session[:cart_id] = @cart.id
          current_user.cart = @cart
        end
      else
        @cart = Cart.find(session[:cart_id])
      end
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
      @cart
    end
    def search_params
      params.permit(:color, :price_in, :type, :occasion)
    end
end
