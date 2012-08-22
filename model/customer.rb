class Customer < ActiveRecord::Base
  has_many :bookings, :dependent => :destroy

  before_save      :homogenize
  attr_accessible  :first_name, :last_name, :email

  validates :first_name, :presence => true, :length => { :in => 2..50 }
  validates :last_name,  :presence => true, :length => { :in => 2..50 }
  validates :email,      :presence => true, :length => { :in => 6..50 }

  private

    def homogenize
      self.first_name.titleize
      self.last_name.titleize
      self.email.downcase
    end

end
