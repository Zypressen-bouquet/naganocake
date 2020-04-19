require 'rails_helper'

RSpec.describe Cart, type: :model do
  # テストが成功することを確認。リレーション先のデータがなければデータ作成ができないため作成する
  context "is User and Product not nil" do 
    before do
      @user = User.create(email:"user@user.com",password:"aaaaaa",
        last_name:" 検証",first_name:"太郎",last_name_kana:"ケンショウ",
        first_name_kana:"タロウ",post_code:"1111111",address:"東京都千代田区千代田１−１",
        phone_number: "0001112222",status: true)
      genre = Genre.create!(genre:"ケーキ",display_status:true)
      @product = Product.create(genre_id: genre.id,name: "商品", unit_price: 300,status: true)
    end

    # テストが成功することを確認
    it "is valid with all columns" do
      cart = Cart.new(user_id: @user.id,product_id: @product.id,units: 10)
      expect(cart).to be_valid
    end

    # product_idが入っていない時、テストが失敗することを確認
    it "is invalid without product_id" do
      cart = Cart.new(user_id: @user.id,product_id: nil,units: 10)
      expect(cart).not_to be_valid
    end

    # unitsが入っていない時、テストが失敗することを確認
    it "is invalid without units" do
      cart = Cart.new(user_id: @user.id,product_id: @product.id,units: nil)
      expect(cart).not_to be_valid
    end
  end
end
