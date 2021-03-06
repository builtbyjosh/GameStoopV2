class CartsController < ApplicationController
    def show
        if logged_in?            
            redirect_to user_cart_path(current_user, current_cart) unless current_cart.id == params[:id].to_i && current_user.id == params[:user_id].to_i            
        else
            require_login
        end  
    end
end