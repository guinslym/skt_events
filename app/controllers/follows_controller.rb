class FollowsController < ApplicationController
  def create
  	unless current_user.id == params[:user_id]
	    @user = User.find(params[:user_id])
	    current_user.follow(@user)
	end
  end

  def destroy
  	unless current_user.id == params[:user_id]
    	@user = User.find(params[:user_id])
    	current_user.stop_following(@user)
    end
  end
end