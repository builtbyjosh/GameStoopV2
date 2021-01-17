class LineItemsController < ApplicationController
  def index
    #binding.pry
    @line_items = LineItem.all 
    
    set_cart
  end

  def show
    
  end

  def new
    @line_item = LineItem.new
  end

  def create
    @cart = current_cart
    @line_item = @cart.line_items.new(line_item_params)

    if @line_item.save      
      redirect_to user_cart_path(@cart, current_user.id)
      
    else      
      render template: 'games/show'
    end
  end

  private

  def line_item_params
    params.require(:line_item).permit(:cart_id, :game_id, :quantity)
  end
end
