class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.valid?
    if @item.save
      redirect_to root_path
    else
      render :new
  end
end

private

  def item_params
  params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :postage_id, :prefecture_id, :day_delivery_id, :price).merge(user_id: current_user.id)
  end
 end
