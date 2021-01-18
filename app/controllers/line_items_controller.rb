class LineItemsController < ApplicationController
  before_action :require_login
  
  def index
    @line_items = LineItem.all
  end

  def show
    
  end

  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = current_cart.line_items.new(line_item_params)

    if @line_item.save
      redirect_to user_cart_path(current_cart.id, current_user.id)      
    else      
      redirect_to games_path
    end
  end

  def destroy
    @cart = current_cart
    @line_item = @cart.line_items.find(params[:id])
    @line_item.destroy
    redirect_to user_cart_path(current_cart.id, current_user.id)
  end

  private

  def line_item_params
    params.require(:line_item).permit(:cart_id, :game_id, :quantity)
  end
end
