class UsersController < ApplicationController
  before_action :set_user
  before_action :move_to_root

  def identification
  end

  def mypage
  end
  
  def logout
  end
  
  private
  def set_user
    @user = User.find(current_user.id)
  end

  def move_to_root
    unless user_signed_in? 
      redirect_to root_path
    end
  end
end
