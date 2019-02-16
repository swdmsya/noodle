class NoodlesController < ApplicationController
  before_action :move_to_index, except: :index
  include NoodlesHelper
  def index
    posts = Post.includes(:user)
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
        posts = posts.where(genre_id: params[:genre])
        @posts = sort(posts)
      end
    end
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
          @post.hashtag_posts.each do |h|
            h.delete
          end
          @post.delete
          redirect_back(fallback_location: root_path)
        end
  end

  def edit
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @posts = @tag.posts.build
    @post  = @tag.posts.page(params[:page])
    @comment    = Comment.new
    @comments   = @posts.comments
  end

  private

    def post_params
      params.require(:post).permit(:impressions, :image, :genre_id)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
