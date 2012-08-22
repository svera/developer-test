class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :room

  attr_accessible :arrival, :leaving, :status

  validates :arrival, :presence => true
  validates :leaving, :presence => true
  validates :status,  :presence => true

end
