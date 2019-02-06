class NoodlesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
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
