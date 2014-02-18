class HomeController < ApplicationController
  def index
  	@events = Event.all
  end

  def user
  	@users = User.all
  end

  def profile
  end

  def show
    #TODO what I have done for Location do it for Event
    @event = Event.find(params[:id])
    @user = User.find(@event.user_id)
    #after this line
    ###don't add this line // @location = @event.location.id
    @location = Location.find(@event.location.id)
    #then
    @hash = Gmaps4rails.build_markers(@location) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow location.address
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end


end
