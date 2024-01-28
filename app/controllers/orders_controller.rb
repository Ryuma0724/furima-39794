class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @address_order = AddressOrder.new
  end

  def new
    @address_order = AddressOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @address_order = AddressOrder.new(address_params)
    if @address_order.valid?
      pay.item
      @address_order.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.require(:address_order).permit(:zip_code, :area_id, :municipality, :street, :building, :phone_number, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: address_params[:price],  # 商品の値段
      card: address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
