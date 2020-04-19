require 'rails_helper'

RSpec.describe Order, type: :model do
  # 外部キーを用いて設定している部分については設定しないとそもそも実装ができないため、記述しない。
  # post_code,address,nameの部分ついては直接入力するパターンもあるため、記述
  context "is User not nil" do
    before do
      @user = User.create(email:"user@user.com",password:"aaaaaa",
        last_name:" 検証",first_name:"太郎",last_name_kana:"ケンショウ",
        first_name_kana:"タロウ",post_code:"1111111",address:"東京都千代田区千代田１−１",
        phone_number: "0001112222",status: true)
    end

    # テストが成功することを確認
    it "is valid with all columns" do
      order = Order.new(user_id: @user.id,payment_method: 1,shipping_fee: 800,total_payment: 2400,status: 1,name:@user.last_name + @user.first_name,address: @user.address,post_code: @user.post_code)
      expect(order).to be_valid
    end

    # 支払い方法がないときテストが失敗することを確認
    it "is invalid without payment_method" do
      order = Order.new(user_id: @user.id,payment_method: nil,shipping_fee: 800,total_payment: 2400,status: 1,name:@user.last_name + @user.first_name,address: @user.address,post_code: @user.post_code)
      expect(order).not_to be_valid
    end

    # 宛名がないとき、テストが失敗することを確認
    it "is invalid without name" do
      order = Order.new(user_id: @user.id,payment_method: 1,shipping_fee: 800,total_payment: 2400,status: 1,name:@user.last_name + @user.first_name,address: @user.address,post_code: @user.post_code)
      expect(order).not_to be_valid
    end

    # 住所がない時、テストが失敗することを確認
    it "is invalid without address" do
      order = Order.new(user_id: @user.id,payment_method: 1,shipping_fee: 800,total_payment: 2400,status: 1,name:@user.last_name + @user.first_name,address: "",post_code: @user.post_code)
      expect(order).not_to be_valid
    end

    # 郵便番号がない時、テストが失敗することを確認
    it "is invalid without post_code" do
      order = Order.new(user_id: @user.id,payment_method: 1,shipping_fee: 800,total_payment: 2400,status: 1,name:@user.last_name + @user.first_name,address: @user.address,post_code: "")
      expect(order).not_to be_valid
    end
  end
end
