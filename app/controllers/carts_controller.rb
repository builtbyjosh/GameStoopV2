class CartsController < ApplicationController
    before_action :require_login

    def show        
        if logged_in?            
            redirect_to user_cart_path(current_user, current_cart) unless current_cart.id == params[:id].to_i            
        else
            require_login
        end  
    end

    def create
        @cart = Cart.new
        if @cart.save
            redirect_to new_cart_line_item_path(@cart)
        else
            render :new
        end
    end

    private

    def cart_params
        params.require(:cart).permit(:total)
    end
end