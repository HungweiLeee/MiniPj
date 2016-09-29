class AddAddressAndgeoFieldToRooms < ActiveRecord::Migration[5.0]
  def change
  	add_column :rooms, :address, :string
  	add_column :rooms, :latitude, :float
  	add_column :rooms, :longitude, :float
  end
end
