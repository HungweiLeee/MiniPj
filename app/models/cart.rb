class Cart < ApplicationRecord
	
	has_many :line_items

  def amount
    self.line_items.map{ |line| line.amount }.sum
  end

	def add_line_item(post)
    line_item = self.line_items.find_by( :post_id => post.id )
    if line_item
      line_item.qty = line_item.qty + 1
      line_item.save!
    else
      self.line_items.create!( :post => post, :qty => 1 )
    end
  end

end
