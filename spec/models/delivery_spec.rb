require 'rails_helper'

RSpec.describe Delivery, type: :model do
  # テストが成功することを確認。リレーション先のデータがなければデータ作成ができないため作成する
  # リレーションについては設定しないとそもそも実装ができないため、記述しない
  context "is User and Product not nil" do 
    before do
      User.create(email:"user@user.com",password:"aaaaaa",
        last_name:" 検証",first_name:"太郎",last_name_kana:"ケンショウ",
        first_name_kana:"タロウ",post_code:"1111111",address:"東京都千代田区千代田１−１",
        phone_number: "0001112222",status: true)
    end

    # テストが成功することを確認
    it "is valid with all columns" do
      delivery = Delivery.new(user_id: 1,post_code: "9999999",address: "東京都新宿区霞ヶ丘町10番1号",
        name: "送先 花子")
      expect(delivery).to be_valid
    end

    # post_codeが入っていない場合、テストが失敗することを確認
    it "is invalid without post_code" do
      delivery = Delivery.new(user_id: 1,post_code: "",address: "東京都新宿区霞ヶ丘町10番1号",
        name: "送先 花子")
      expect(delivery).not_to be_valid
    end

    # addressが入っていない場合、テストが失敗することを確認
    it "is valid without address" do
      delivery = Delivery.new(user_id: 1,post_code: "9999999",address: "",
        name: "送先 花子")
      expect(delivery).not_to be_valid
    end

    # nameが入っていない場合、テストが失敗することを確認
    it "is valid without name" do
      delivery = Delivery.new(user_id: 1,post_code: "9999999",address: "東京都新宿区霞ヶ丘町10番1号",
        name: "")
      expect(delivery).not_to be_valid
    end
  end
end
