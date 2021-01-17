class CartsController < ApplicationController
    def index
        @carts = Cart.all
        current_user
    end

    def show
        @cart = current_cart
    end

    def destroy
        @cart = @current_cart
        @cart.destroy
        session[:cart_id] = nil
        redirect_to root_path
    end

    def new
        @cart = Cart.new
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