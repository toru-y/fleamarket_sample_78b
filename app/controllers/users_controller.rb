class UsersController < ApplicationController
  before_action :move_to_root
  before_action :get_category_parents

  def identification
  end

  def mypage
  end
  
  def logout
  end
  
  private
  def move_to_root
    unless user_signed_in? 
      redirect_to root_path
    end
  end

  def get_category_parents
    @category_parent_array = Category.where(ancestry: nil)
  end
end
