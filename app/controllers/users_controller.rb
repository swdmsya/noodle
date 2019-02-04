class UsersController < ApplicationController

  def index
    @user  = current_user
    @users = @user.followings
    @posts = []
      if @users.present?
        @users.each do |user|
          posts = Post.where(user_id: user.id).order(created_at: :desc)
          @posts.concat(posts)
        end
          @posts = @posts.sort_by{|post| post.created_at}.reverse
          if @posts.nil?
            flash[:notice]="まだ投稿がありません…"
            redirect_to("/")
          end
      else
        flash[:notice]="誰かをフォローしてみましょう！"
        redirect_to("/")
      end
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
