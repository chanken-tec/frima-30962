class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :destroy, :edit, :update]
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  before_action :item_user, only: [:edit, :update, :destroy]
  
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
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :information, :category_id, :condition_id, :delivery_fee_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_user
    if @item.user_id != current_user.id || @item.order.present?
      redirect_to root_path
    end
  end
end
