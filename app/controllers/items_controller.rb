class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if current_user.id != @item.user_id or @item.order != nil
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params) 
       redirect_to item_path
    else
       render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id = @item.user_id
       @item.destroy
    end
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :content, :genre_id, :condition_id, :charge_id, :area_id, :leadtime_id, :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
  
end
