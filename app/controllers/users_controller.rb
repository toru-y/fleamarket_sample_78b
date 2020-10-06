class UsersController < ApplicationController
  before_action :set_user_params
  before_action :move_to_root

  def show
  end

  def update
  end

  def mypage
  end
  
  private
  def set_user_params
    @user = User.find(params[:id])
  end

  def move_to_root
    unless user_signed_in? 
      redirect_to root_path
    end
  end
end
