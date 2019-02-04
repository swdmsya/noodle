class NoodlesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
  end

  def new
    @noodle = Post.new
  end

  def create
    @noodle = Post.new(post_params)
    if @noodle.save!
      redirect_to  root
    else
      redirect_to :new
    end
  end

  def edit
  end

  private

    def post_params
      params.require(:post).permit(:impressions, :image, :user_id ,:genre_id)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
