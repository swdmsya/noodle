class Post < ApplicationRecord
	#association
	belongs_to :genre, optional: true
	belongs_to :user, optional: true

	has_many :likes, dependent: :destroy
	has_many :liked_users, through: :likes, source: :user

	has_many :comments, dependent: :destroy

	has_and_belongs_to_many :hashtags
	has_many :hashtag_posts
	#activestorage
	has_one_attached :image

	#validation
	validates :user_id, presence: true
	#validates :impressions, presence: true
	validates :image, presence: true

	def user_liked?(user_id)
		likes.find_by(user_id: user_id)
	end

	

	after_create do
		post = Post.find_by(id: self.id)
		hashtags = self.impressions.scan(/[#＃][Ａ-Ｚａ-ｚA-Za-z一-鿆0-9０-９ぁ-ヶｦ-ﾟー]+/)
		hashtags.uniq.map do |hashtag|
		  tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#').delete('＃'))
			HashtagPost.create(post_id: post.id, hashtag_id: tag.id)
		end
	end
end
