class LineItem < ApplicationRecord

	belongs_to :post
  belongs_to :order
  belongs_to :cart
  
  def amount
    self.post.price * self.qty
  end

end
