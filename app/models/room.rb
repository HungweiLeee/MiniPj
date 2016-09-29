class Room < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations

  #geocoded_by :address
  #after_validation :geocode

  #validates :home_type, presence: true
  #validates :room_type, presence: true
  #validates :accommodate, presence: true
  #validates :bed_room, presence: true
  #validates :bath_room, presence: true
  #validates :summary, presence: true
  #validates :is_TV, presence: true
  #validates :is_WiFi, presence: true
  #validates :price, presence: true
  #validates :summary, presence: true

end
