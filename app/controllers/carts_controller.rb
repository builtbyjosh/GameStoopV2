class CartsController < ApplicationController    

    def show
        require_login unless logged_in?
        # if logged_in?            
        #     redirect_to user_cart_path(current_user, current_cart) unless current_cart.id == params[:id].to_i && current_user.id == params[:user_id].to_i            
        # else
        #     require_login
        # end  
    end

    private

    def cart_params
        params.require(:cart).permit(:total)
    end
end