class Event < ActiveRecord::Base
  attr_accessible :location_id, :title, :description, :event_day
  belongs_to :location
  belongs_to :user

  resourcify
  default_scope lambda { order('events.event_day') }

  acts_as_followable

  scope :recent, lambda { where("events.event_day > ?", Date.today) }

end
