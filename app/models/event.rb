class Event < ActiveRecord::Base
  attr_accessible :location_id, :title
  belongs_to :location
end
