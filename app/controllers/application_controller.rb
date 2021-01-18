class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :current_cart
    add_flash_types :error
    before_action :current_cart

    private
  
    def current_cart
      if !session[:cart_id].nil?
        Cart.find(session[:cart_id])
      else
          @cart = Cart.new(user_id: session[:user_id])          
          @cart.save
          session[:cart_id] = @cart.id
      end
    end
  
    def current_user
      @user = User.find_by(id: session[:user_id])
    end
  
    def logged_in?
      !!current_user
    end

    def require_login
      redirect_to root_path unless logged_in?
    end
end
