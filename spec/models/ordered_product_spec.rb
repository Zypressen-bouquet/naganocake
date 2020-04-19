require 'rails_helper'

RSpec.describe OrderedProduct, type: :model do
  # 外部キーを用いて検証している部分については設定しないとそもそも実装ができないため、記述しない
  context "is User and Product not nil" do 
    before do
      @user = User.create(email:"user@user.com",password:"aaaaaa",
        last_name:" 検証",first_name:"太郎",last_name_kana:"ケンショウ",
        first_name_kana:"タロウ",post_code:"1111111",address:"東京都千代田区千代田１−１",
        phone_number: "0001112222",status: true)
      genre = Genre.create!(genre:"ケーキ",display_status:true)
      @product = Product.create(genre_id: genre.id,name: "商品", unit_price: 300,status: true)
      @order = Order.create(user_id: @user.id,payment_method: 1,shipping_fee: 800,total_payment: 2400,status: 1,name:@user.last_name + @user.first_name,address: @user.address,post_code: @user.post_code)
    end

    # テストが成功することを確認
    it "is valid with all columns" do
      oproduct = OrderedProduct.new(order_id: @order.id,product_id: @product.id,working_status: 1,units: 10,price: @product.unit_price)
      expect(oproduct).to be_valid
    end

    # working_statusが入っていない場合、エラーになることを確認
    it "is invalid without working_status" do
      oproduct = OrderedProduct.new(order_id: @order.id,product_id: @product.id,working_status: nil,units: 10,price: @product.unit_price)
      expect(oproduct).not_to be_valid
    end
  end
end