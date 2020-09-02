class LaboItemsController < ApplicationController
  before_action :set_labo_item, only: [:show, :edit, :update, :destroy]

  # GET /labo_items
  # GET /labo_items.json
  def index
    @labo_items = LaboItem.all
  end

  # GET /labo_items/1
  # GET /labo_items/1.json
  def show
  end

  # GET /labo_items/new
  def new
    @labo_item = LaboItem.new
  end

  # GET /labo_items/1/edit
  def edit
  end

  # POST /labo_items
  # POST /labo_items.json
  def create
    @labo_item = LaboItem.new(labo_item_params)

    respond_to do |format|
      if @labo_item.save
        format.html { redirect_to @labo_item, notice: 'Labo item was successfully created.' }
        format.json { render :show, status: :created, location: @labo_item }
      else
        format.html { render :new }
        format.json { render json: @labo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labo_items/1
  # PATCH/PUT /labo_items/1.json
  def update
    respond_to do |format|
      if @labo_item.update(labo_item_params)
        format.html { redirect_to @labo_item, notice: 'Labo item was successfully updated.' }
        format.json { render :show, status: :ok, location: @labo_item }
      else
        format.html { render :edit }
        format.json { render json: @labo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labo_items/1
  # DELETE /labo_items/1.json
  def destroy
    @labo_item.destroy
    respond_to do |format|
      format.html { redirect_to labo_items_url, notice: 'Labo item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labo_item
      @labo_item = LaboItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def labo_item_params
      params.require(:labo_item).permit(:name, :price, :description, :image, :category, :brand, :size, :condition, :postage_player, :prefecture, :handling_times)
    end
end
