class OrderDetail < ApplicationRecord
  
  belongs_to :item
  belongs_to :order
  
  enum status: {
    入金待ち: 0,
　　入金確認: 1, 
    制作中: 2,
    発送準備: 3,
    発送済み: 4
  }
  
end
