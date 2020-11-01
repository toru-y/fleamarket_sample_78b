class CreditCardsController < ApplicationController
  require 'payjp'
  before_action :move_to_user_registration, only: [:show, :new, :create, :destroy]
  before_action :set_card, only: [:show, :destroy]
  before_action :get_category_parents, only:[:show, :new]

  def show
    # 登録したカードを確認する、登録していない場合は空
    if @card.present?
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
    end
  end

  def new
    @card = CreditCard.new
  end

  def create
    # テスト用秘密鍵
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    # apiでトークンが取得できたか確認
    if params[:payjpToken].blank?
      redirect_to action: :new
    else
      customer = Payjp::Customer.create(
        card: params[:payjpToken],
        metadata: {user_id: current_user.id}
      )
      # DBに保存
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)

      if @card.save
        redirect_to credit_card_path(id: @card.id)
      else
        redirect_to action: :new
      end
    end
  end
  
  def destroy
    if @card.present?
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.destroy
      redirect_to action: :new
    else
      redirect_to action: :show
    end
    
  end

  private

  def move_to_user_registration
    redirect_to new_user_registration unless user_signed_in?
  end

  def set_card
    @card = CreditCard.find(current_user.credit_card.id)
  end

  def get_category_parents
    @category_parent_array = Category.where(ancestry: nil)
  end
end
