require 'rails_helper'

describe Image do
  describe '#create' do
    it "画像が選択されていればOK" do
      user = create(:user)
      item = create(:item, user_id: user.id)
      image = create(:image, item_id: item.id)
      expect(item).to be_valid
    end

    it "imageが空なら登録不可" do
      image = build(:image, image: nil)
      image.valid?
      expect(image.errors[:image]).to include("を入力してください")
    end
  end
end