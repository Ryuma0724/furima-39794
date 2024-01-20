class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:id, :title, :content, :genre_id, :condition_id, :charge_id, :area_id, :leadtime_id, :price).merge(user_id: current_user.id)
  end
  
end
