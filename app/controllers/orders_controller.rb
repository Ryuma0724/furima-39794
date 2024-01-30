class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]
  
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @address_order = AddressOrder.new
    if current_user.id != @item.user_id && @item.order.present?
      redirect_to root_path
    end

    if current_user.id == @item.user_id && @item.present?
      redirect_to root_path
    end
  end

  def create
    @address_order = AddressOrder.new(address_params)
    if @address_order.valid?
      pay_item
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
      amount: @item.price,  # 商品の値段
      card: address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
