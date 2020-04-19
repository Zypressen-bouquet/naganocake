require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with all columns" do #全てのカラムにデータが入っているのが正となる
    user = User.new(email:"user@user.com",password:"aaaaaa",last_name:" 検証",first_name:"太郎",last_name_kana:"ケンショウ",
      first_name_kana:"タロウ",post_code:"1111111",address:"東京都千代田区千代田１−１",phone_number: "0001112222",status: true)
      expect(user).to be_valid
  end

  it "is invalid without a password" do # パスワードがない場合、エラー
      user = User.new(email:"user@user.com",password: "",last_name:" 検証",first_name:"太郎",last_name_kana:"ケンショウ",
      first_name_kana:"タロウ",post_code:"1111111",address:"東京都千代田区千代田１−１",phone_number: "0001112222",status: true)
      expect(user).not_to be_valid
  end

  it "is invalid without a email" do   # メールアドレスがない場合、エラー
      user = User.new(email:"",password:"aaaaaa",last_name:" 検証",first_name:"太郎",last_name_kana:"ケンショウ",
      first_name_kana:"タロウ",post_code:"1111111",address:"東京都千代田区千代田１−１",phone_number: "0001112222",status: true)
      expect(user).not_to be_valid
  end

  it "is invalid without a last_name" do  # 苗字がない場合、エラー
      user = User.new(email:"user@user.com",password:"aaaaaa",first_name:"太郎",last_name:"",last_name_kana:"ケンショウ",
      first_name_kana:"タロウ",post_code:"1111111",address:"東京都千代田区千代田１−１",phone_number: "0001112222",status: true)
      expect(user).not_to be_valid
  end

  it "is invalid without a first_name" do # 名前がない場合、エラー
    user = User.new(email:"user@user.com",password:"aaaaaa",last_name:" 検証",first_name:"",last_name_kana:"ケンショウ",
      first_name_kana:"タロウ",post_code:"1111111",address:"東京都千代田区千代田１−１",phone_number: "0001112222",status: true)
      expect(user).not_to be_valid
  end

  it "is invalid without a last_name_kana" do  # カナ名の苗字がない場合、エラー
      user = User.new(email:"user@user.com",password:"aaaaaa",last_name:" 検証",first_name:"太郎",last_name_kana:"",
      first_name_kana:"タロウ",post_code:"1111111",address:"東京都千代田区千代田１−１",phone_number: "0001112222",status: true)
      expect(user).not_to be_valid
  end


  it "is invalid without a first_name_kana" do # カナ名の名前がない場合、エラー
    user = User.new(email:"user@user.com",password:"aaaaaa",last_name:" 検証",first_name:"太郎",last_name_kana:"ケンショウ",
      first_name_kana:"",post_code:"1111111",address:"東京都千代田区千代田１−１",phone_number: "0001112222",status: true)
      expect(user).not_to be_valid
  end

  it "is invalid without a post_code" do  # 郵便番号がない場合、エラー
    user = User.new(email:"user@user.com",password:"aaaaaa",last_name:" 検証",first_name:"太郎",last_name_kana:"ケンショウ",
      first_name_kana:"タロウ",post_code:"",address:"東京都千代田区千代田１−１",phone_number: "0001112222",status: true)
      expect(user).not_to be_valid
  end

  it "is invalid without a address" do # 住所がない場合、エラー
    user = User.new(email:"user@user.com",password:"aaaaaa",last_name:" 検証",first_name:"太郎",last_name_kana:"ケンショウ",
      first_name_kana:"タロウ",post_code:"1111111",address:"",phone_number: "0001112222",status: true)
      expect(user).not_to be_valid
  end

  it "is invalid without a phone_number" do # 電話番号がない場合、エラー
    user = User.new(email:"user@user.com",password:"aaaaaa",last_name:" 検証",first_name:"太郎",last_name_kana:"ケンショウ",
      first_name_kana:"タロウ",post_code:"1111111",address:"東京都千代田区千代田１−１",phone_number: "",status: true)
      expect(user).not_to be_valid
  end

  it "is invalid without a status" do # ステータスがない場合、エラー
    user = User.new(email:"user@user.com",password:"aaaaaa",last_name:" 検証",first_name:"太郎",last_name_kana:"ケンショウ",
      first_name_kana:"タロウ",post_code:"1111111",address:"東京都千代田区千代田１−１",phone_number: "0001112222",status: nil)
      expect(user).to be_valid
  end

end
