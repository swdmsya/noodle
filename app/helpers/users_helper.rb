module UsersHelper
  def current_user?(user)
    user == current_user
  end
  def sort(posts)
    posts.order("created_at DESC").page(params[:page]).per(5)
  end
end
