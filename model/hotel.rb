class Hotel < ActiveRecord::Base
  has_many :rooms
  validates :name, :presence => true, :length => { :in => 6..50 }
end
