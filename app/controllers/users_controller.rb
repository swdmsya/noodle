class UsersController < ApplicationController

  def index
    @posts = Post.where(user_id: current_user.followings).order("created_at DESC").page(params[:page]).per(10)
  end
  
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
