module NoodlesHelper
    def sort(posts)
        posts.order("created_at DESC").page(params[:page]).per(5)
    end
end
