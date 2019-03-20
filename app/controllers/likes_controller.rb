class LikesController < ApplicationController
    def create
        @like = Like.create(user_id: current_user.id, post_id: params[:noodle_id])
        @likes = Like.where(post_id: params[:noodle_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        like = Like.find_by(user_id: current_user.id, post_id: params[:noodle_id])
        like.destroy
        @likes = Like.where(post_id: params[:noodle_id])
        redirect_back(fallback_location: root_path)
    end
end
