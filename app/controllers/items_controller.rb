class ItemsController < ApplicationController
  def index
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

  private
  def item_params
    params.require(:item).permit(:name, :information, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :lead_time_id, :price, :user, :image).merge(user_id: current_user.id)
  end
end
