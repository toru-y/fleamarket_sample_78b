class CreditCardsController < ApplicationController
  require 'payjp'
  before_action :move_to_root

  def show
    # 登録したカードを確認する、登録していない場合は空
    card = CreditCard.find_by(user_id: current_user.id)
    if card.present?
      # flash[:notice] = 'クレジットカード情報の取得に成功しました。'
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card_info = customer.cards.retrieve(card.card_id)
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
      # flash.now[:alert] = "登録に失敗しました。内容を確認して再度登録してください。"
      redirect_to action: :new
    else
      # Payjpの継承オブジェクトCustomerに保存
      customer = Payjp::Customer.create(
        card: params[:payjpToken],
        metadata: {user_id: current_user.id}
      )
      # DBに保存
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)

      if @card.save
        # flash.now[:notice] = 'クレジットカードの登録が完了しました。'
        redirect_to card_path(id: @card.id)
      else
        # flash[:alert] = 'クレジットカード登録に失敗しました'
        redirect_to action: :new
      end
    end
  end
  
  def destroy
    card = CreditCard.find_by(card_id: params[:id])

    if card.present?
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.destroy
      # flash[:notice] = 'クレジットカード情報を削除しました'
    else
      # flash[:alert] = 'クレジットカード情報の削除に失敗しました'
    end
    redirect_to action: :new
  end

  private
  def move_to_root
    # flash[:notice] = 'カードのご利用はユーザー登録をしてから行ってください。'
    redirect_to ew_user_registration unless user_signed_in?
  end
end