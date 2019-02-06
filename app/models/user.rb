class User < ApplicationRecord
  #association
has_many :posts
has_many :shops, through: :posts
 has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

 has_many :followings, through: :following_relationships

 has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy

 has_many :followers, through: :follower_relationships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  validates :email, presence: true
  validates :nickname, presence: true

  #フォロしていいたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  #ユーザーをフォローする
  def follow(other_user)
    followings << other_user
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def following_posts
    user_followings = current_user.followings
    user_follow_posts = []
    user_followings.each do |u|
      user_follow_posts << u.posts
    end
  end

end
