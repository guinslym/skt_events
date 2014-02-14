class HomeController < ApplicationController
  def index
  	@events = Event.all
  end

  def user
  	@users = User.all
  end

  def profile
  end
end
