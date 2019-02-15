class NoodlesController < ApplicationController
  before_action :move_to_index, except: :index
  include NoodlesHelper
  def index
    posts = Post.includes(:user)
    if params[:genre]
      posts = posts.where(genre_id: params[:genre])
    end
    @posts = sort(posts)
    @like = Like.new
    @top_five = Post.includes(:user).order("likes_count DESC")
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    @comments = @post.comments.includes(:user)
  end

  def new
    @noodle = Post.new
  end

  def create
    @noodle = current_user.posts.build(post_params)
    if @noodle.save
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
        if @post.user_id == current_user.id
          comment.destroy
          redirect_back(fallback_location: root_path)
        end
  end

  def edit
  end

  private

    def post_params
      params.require(:post).permit(:impressions, :image, :genre_id)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
