class User < ActiveRecord::Base
  rolify
  include Gravtastic
  gravtastic
  acts_as_follower
  acts_as_followable
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  has_many :events
  has_one :profile, dependent: :delete

 
  after_create :assign_default_role

  def assign_default_role
    add_role(:visitor)
  end


end
