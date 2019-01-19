class NoodlesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @noodle = current_user.posts.build
    @shop = Shop.new
  end

  def create
    @noolde = current_user.post.build(post_params)
    @shop = Shop.new(Shop_params)
    if @noodle.save
      Shop.where(id: @shop.id).first_or_create(shop_params)
      redirect_to  root
    else
      redirect_to :new
    end
  end

  def edit
  end

  private

    def post_params
      params.require(:post).permit(:impressions, :shop_id, :genre_id)
    end

    def shop_params
      params.require(:shop).permit(:id, :name, :address, :url)
    end
end
