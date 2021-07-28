class Item < ApplicationRecord
  
  attachment :image
  
  has_many :cart_items
  has_many :order_details
  belongs_to :genre
  
  def add_tax_price
    (self.price * 1.10).round
  end
end
