class CommentsController < ApplicationController
    def create
        comment = Comment.new(text: comment_params[:text], post_id: comment_params[:noodle_id], user_id: current_user.id)
        if comment.save
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        if comment.user_id == current_user.id
          comment.destroy
          redirect_back(fallback_location: root_path)
        end
    end

    private
    def comment_params
        params.permit(:text, :noodle_id)
    end
end