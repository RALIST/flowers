class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_cart

  private
     def current_cart
        if current_user
          if current_user.cart
            @cart = current_user.cart
          else
            @cart = Cart.create
            cookies.permanent.signed[:cart_id] = @cart.id
            current_user.cart = @cart
          end
        else
          @cart = Cart.find(cookies.signed[:cart_id])
        end
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      cookies.permanent.signed[:cart_id] = @cart.id
      @cart
    end
end
