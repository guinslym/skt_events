class FollowsController < ApplicationController

  #following USERS
  def create
  	unless current_user.id == params[:user_id]
	    @user = User.find(params[:user_id])
	    current_user.follow(@user)
	  end
  end

  # UNfollowing USERS
  def destroy
  	unless current_user.id == params[:user_id]
    	@user = User.find(params[:user_id])
    	current_user.stop_following(@user)
    end
  end

  #subscribing to an event
  def subscribe
    current_user.id == params[:user_id]
    event = Event.fing(params[:event_id])
    #check to see if the user is following the event
    #if not create it the subscrition
    unless current_user.following?(event)
      user.follow(event)
    end
  end

    # UNsubscribing to an event
  def unsubscribe
    current_user.id == params[:user_id]
    event = Event.fing(params[:event_id])
    #check to see if the user is following the event
    #if not create it the subscrition
    if current_user.following?(event)
      user.stop_following(event)
    end
  end
end