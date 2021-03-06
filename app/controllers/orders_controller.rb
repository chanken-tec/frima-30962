class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find
  before_action :item_user, only: [:index, :create]

  def index
      @address_order = AddressOrder.new
  end

  def create
    @address_order = AddressOrder.new(order_params)
    if @address_order.valid?
      pay_item
      @address_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end


  private

  def order_params
    params.require(:address_order).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token]) 
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token], 
      currency: 'jpy'                 
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def item_user
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end
  
end