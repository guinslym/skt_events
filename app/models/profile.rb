class Profile < ActiveRecord::Base
  attr_accessible :bio, :name

  belongs_to :user
end
