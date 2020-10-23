class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]
  before_action :get_category_parents, only: [:index, :new]

  def index
    @item = Item.all.order("created_at DESC").limit(10)
  end

  def new
    @item = Item.new
    @item.images.new
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil)
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end 
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
    # binding.pry
  end

  def update
    if @item.update(item_update_params)
      redirect_to root_path
    else
      @item = Item.find(params[:id])
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :name, 
      :price, 
      :description, 
      :size_id, 
      :category_id, 
      :brand, 
      :condition_id, 
      :shipping_fee_id, 
      :handling_time_id, 
      :prefecture_id, 
      :status, 
      images_attributes: [:image]
    ).merge(user_id: current_user.id)
  end

  def item_update_params
    params.require(:item).permit(
      :name, 
      :price, 
      :description, 
      :size_id, 
      :category_id, 
      :brand, 
      :condition_id, 
      :shipping_fee_id, 
      :handling_time_id, 
      :prefecture_id, 
      :status, 
      images_attributes: [:image, :_destroy, :id]
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def get_category_parents
    @category_parent_array = Category.where(ancestry: nil)
  end
end
