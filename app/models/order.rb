class Order < ApplicationRecord

	belongs_to :user
  has_many :line_items

  def add_line_items(post)
    cart.line_items.each do |line|
      self.line_items.build( :post => line.post, :qty => line.qty )
    end

    self.amount = cart.amount
  end
  
end
