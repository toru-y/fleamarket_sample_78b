require 'rails_helper'

describe User do
  describe '#create' do

    it "全て(nickname, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birth_date)が入力されていれば登録可能" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameが空なら登録不可" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors.messages[:nickname]).to include("を入力してください")
    end

    it "emailが空なら登録不可" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "emailが＠を含む形で空なら登録不可" do
      user = build(:user, email: "aaagmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
    
    it "emailが重複していたら登録不可" do
      user1 = create(:user)
      expect(build(:user, email: user1.email)).to_not be_valid
    end
    
    it "passwordが空なら登録不可" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    
    it "passwordが7文字よりも短ければ登録不可" do
      user = build(:user, password: "111aaa")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
    
    it "passwordが半角英字のみなら登録不可" do
      user = build(:user, password: "aaaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end
   
    it "passwordが半角数字のみなら登録不可" do
      user = build(:user, password: "1111111")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

    it "passwordとpassword_firmationが一致しないなら登録不可" do
      user = build(:user, password_confirmation: "1111bbbb")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "last_nameが空なら登録不可" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "last_nameが全角かな・カナ・漢字意外なら登録不可" do
      user = build(:user, last_name: "yamada")
      user.valid?
      expect(user.errors[:last_name]).to include("は不正な値です")
    end

    it "first_nameが空なら登録不可" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    
    it "first_nameが全角かな・カナ・漢字意外なら登録不可" do
      user = build(:user, first_name: "hanako")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end
   
    it "last_name_kanaが空なら登録不可" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end
   
    it "last_name_kanaが全角カナ以外なら登録不可" do
      user = build(:user, last_name_kana: "yamada")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end

    it "first_name_kanaが空なら登録不可" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "first_name_kanaが全角カナ以外なら登録不可" do
      user = build(:user, first_name_kana: "hanako")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "birth_dateが空なら登録不可" do
      user = build(:user, birth_date: nil)
      user.valid?
      expect(user.errors[:birth_date]).to include("を入力してください")
    end
  end
end