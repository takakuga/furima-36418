class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :move_to_index, except: [:index, :new, :create, :show]
  before_action :set_item, only: [:edit, :update, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
      else
        render :edit
    end
  end
  
  def show
  end

  def set_item
    @item = Item.find(params[:id])
  end



  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :postage_id,:prefecture_id, :day_delivery_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    if current_user.id != @item.user.id
      redirect_to action: :index
    end
  end
end
