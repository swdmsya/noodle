class UsersController < ApplicationController
  include UsersHelper
  def index
    posts = Post.where(user_id: current_user.followings)
    @posts = sort(posts)
    if params[:hashtag]
      if hashtag = Hashtag.find_by(hashname: params[:hashtag])
        hashtagpost = HashtagPost.where(hashtag_id: hashtag.id)
        posts = []
        hashtagpost.each do |hp|
          id = hp.post_id
          post = Post.find(id)
          posts << post
        end
        @posts = posts.sort_by!{|post| post.created_at}.reverse!
      else
        flash[:notice] = "該当するハッシュタグはありませんでした"
        redirect_back(fallback_location: root_path)
      end
    end    
    if params[:genre]
      if params[:genre] == ""
        flash[:notice] = "ジャンルを選択してください"
      else
        posts = Post.where(user_id: current_user.followings, genre_id: params[:genre])
        @posts = sort(posts)
      end
    end
    
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
