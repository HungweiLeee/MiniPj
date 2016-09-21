class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
    	t.integer :post_id
      t.integer :order_id 
      t.integer :qty

      t.timestamps
    end
  end
end
