class UsersController < ApplicationController
  include UsersHelper
  def index
    posts = Post.where(user_id: current_user.followings)
    if params[:genre]
      posts = Post.where(user_id: current_user.followings, genre_id: params[:genre])
    end
    @posts = sort(posts)
    @like = Like.new
    @top_five = Post.where(user_id: current_user.followings).order("likes_count DESC")
  end
  
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @posts = Post.where(user_id: @user.id)
    @like_count = 0
    @posts.each do |p|
      like = p.likes_count
      @like_count += like
    end
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
