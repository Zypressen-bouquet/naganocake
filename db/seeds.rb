# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Admin.create!(email: "admin@admin.com",password: "aaaaaa")
  Genre.create!(genre:"ケーキ",display_status:true)
  Genre.create!(genre:"プリン",display_status:true)
  Genre.create!(genre:"焼き菓子",display_status:true)
  Genre.create!(genre:"キャンディ",display_status:true)

  5.times.each do |i|
    Product.create!(genre_id: 1,name: "商品#{i+1}", unit_price: (i+1) * 300,status: true)
  end

  15.times.each do |i|
  User.create(email:"user#{i+1}@user.com",password:"aaaaaa",
    last_name:" 検証",first_name:"太郎",last_name_kana:"ケンショウ",
    first_name_kana:"タロウ",post_code:"1111111",address:"東京都千代田区千代田１−１",
    phone_number: "0001112222",status: true)
  end