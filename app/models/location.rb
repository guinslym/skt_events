class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :parkname, :suburbs
  has_many :events

  geocoded_by :address   # can also be an IP address
  after_validation :geocode
end
