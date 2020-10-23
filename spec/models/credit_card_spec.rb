require 'rails_helper'

describe CreditCard do
  describe '#create' do
    
    it "全て入力されていればOK" do
      user = create(:user)
      card = create(:credit_card, user_id: user.id)
      expect(card).to be_valid
    end
    
    it "card_idが空なら登録不可" do
      card = build(:credit_card, card_id: nil)
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end

    it "customer_idが空なら登録不可" do
      card = build(:credit_card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end
  end
end