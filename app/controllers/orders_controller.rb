class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @address_order = AddressOrder.new
  end

  def create
    @address_order = AddressOrder.new(address_params)
    if @address_order.valid?
      @address_order.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.require(:address_order).permit(:zip_code, :area_id, :municipality, :street, :building, :phone_number, :order_id, :user_id, :item_id).merge(user_id: current_user.id)
  end  
end
