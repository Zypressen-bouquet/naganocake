module ApplicationHelper

  def disp_price(price)
    price.to_s(:delimited)
  end

# 不要なので使われている場所を調査し、削除する予定
  def disp_tax_price(price)
    ((price * 1.1).floor).to_s(:delimited)
  end

  def tax_price(price)
    (price * 1.1).floor
  end
  
end
