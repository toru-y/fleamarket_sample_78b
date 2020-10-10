require 'rails_helper'

describe Item do
  describe '#create' do
    it "全て項目が入力されていればOK" do
      user = create(:user)
      item = create(:item, user_id: user.id)
      expect(item).to be_valid
    end

    it "nameが空なら登録不可" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "descriptionが空なら登録不可" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "category_idが空なら登録不可" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "size_idが空なら登録不可" do
      item = build(:item, size_id: nil)
      item.valid?
      expect(item.errors[:size_id]).to include("を入力してください")
    end

    it "condition_idが空なら登録不可" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("を入力してください")
    end

    it "shipping_fee_idが空なら登録不可" do
      item = build(:item, shipping_fee_id: nil)
      item.valid?
      expect(item.errors[:shipping_fee_id]).to include("を入力してください")
    end

    it "prefecture_idが空なら登録不可" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "handling_time_idが空なら登録不可" do
      item = build(:item, handling_time_id: nil)
      item.valid?
      expect(item.errors[:handling_time_id]).to include("を入力してください")
    end

    it "priceが空なら登録不可" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "priceがinteger以外なら登録不可" do
      item = build(:item, price: "３００")
      item.valid?
      expect(item.errors[:price]).to include("は数値で入力してください")
    end

    it "priceが300円未満なら登録不可" do
      item = build(:item, price: "299")
      item.valid?
      expect(item.errors[:price]).to include("は300以上の値にしてください")
    end

    it "priceが9999999円よりも高額なら登録不可" do
      item = build(:item, price: "10000000")
      item.valid?
      expect(item.errors[:price]).to include("は9999999以下の値にしてください")
    end

    it "statusが空なら登録不可" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end
  end
end