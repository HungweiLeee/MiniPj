class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :home_type
      t.string :room_type
      t.integer :accommodate
      t.integer :bed_room
      t.integer :bath_room
      t.text :summary
      t.boolean :is_TV
      t.boolean :is_WiFi
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
