require 'rails_helper'

RSpec.describe Genre, type: :model do
  #全てのカラムにデータが入っていることを確認
  it "is valid with all columns" do 
    genre = Genre.new(genre: "ケーキ",display_status: "true")
    expect(genre).to be_valid
  end

  # ジャンル名が入っていない時に失敗することを確認
  it "is invalid without genre " do 
    genre = Genre.new(genre: "",display_status: "true")
    expect(genre).not_to be_valid
  end

  # ステータスが入っていない時に失敗することを確認
  it "is invalid without display_status " do 
    genre = Genre.new(genre: "ケーキ",display_status: nil)
    expect(genre).not_to be_valid
  end


end
