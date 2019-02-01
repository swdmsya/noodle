class NoodlesController < ApplicationController

  def index
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
      params.require(:post).permit(:impressions, :image, :user_id  :genre_id)
    end
end
