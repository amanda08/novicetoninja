class FollowingsController < ApplicationController
  def show
    @title = "Following"
    @user = User.find(params[:user_id])
    @users = @user.followed_users.paginate(page: params[:page])
  end
end
