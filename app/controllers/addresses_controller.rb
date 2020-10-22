class AddressesController < ApplicationController
  before_action :set_user_params, only: [:new, :edit]
  before_action :set_address_params, only: [:edit, :destroy]

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to mypage_users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to mypage_users_path
    else
      render :edit
    end
  end

  def destroy
    if @address.destroy
      redirect_to mypage_users_path
    else
      render :edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def set_user_params
    @user = User.find(current_user.id)
  end

  def set_address_params
    @address = Address.find_by(user_id: current_user.id)
  end
end
