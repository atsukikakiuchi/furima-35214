class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit]
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

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def edit
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :condition_id, :charge_id, :prefecture_id, :estimated_shopping_date_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if user_signed_in? && @item.user_id != current_user.id
      redirect_to root_path
    end
  end
end

