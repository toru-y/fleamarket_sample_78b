class ItemsController < ApplicationController
  def index
  end

  def new
    if user_signed_in?
      @item = Item.new
      @item.images.new
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(set_item_params)
    if @item.images.present?
      @item.save
    end
    redirect_to root_path
  end

  private
  def set_item_params
    params.require(:item).permit(:name, :price, :description, :size, :category, :condition, :shipping_fee, :handling_time, :prefecture, :brand, images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
