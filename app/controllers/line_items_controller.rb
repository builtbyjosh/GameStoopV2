class LineItemsController < ApplicationController
  def index
    #binding.pry
    @line_items = LineItem.all 
    
    set_cart
  end

  def show
    
  end

  def new
    set_cart
    redirect_to carts_path if !@cart
    @line_item = LineItem.new
  end

  def create
    @cart = Cart.find_by(id: params[:line_item][:cart_id])
    @line_item = LineItem.new(line_item_params)
    if @line_item.save

      redirect_to cart_line_items_path(@line_item.cart)
    else      
      render :new
    end
  end

  private

  def set_cart
    @cart ||= Cart.find_by(id: params[:cart_id])
  end

  def line_item_params
    params.require(:line_item).permit(:cart_id, :game_id, :quantity)
  end
end
