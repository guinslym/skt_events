class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :parkname, :suburbs
  has_many :events
end
