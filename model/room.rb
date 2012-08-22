class Room < ActiveRecord::Base
  belongs_to :hotel
  has_many   :bookings

  attr_accessible  :name, :pax, :quantity, :price_per_night

  validates :name,            :presence => true
  validates :pax,             :presence => true
  validates :quantity,        :presence => true
  validates :price_per_night, :presence => true

end
