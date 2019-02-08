class Post < ApplicationRecord
	#association
	belongs_to :genre, optional: true
	belongs_to :user, optional: true

	has_many :likes
	has_many :liked_users, through: :likes, source: :user
	#activestorage
	has_one_attached :image

	#validation
	validates :user_id, presence: true
	#validates :impressions, presence: true
	validates :image, presence: true

	def user_liked?(user_id)
		likes.find_by(user_id: user_id)
	end
end
