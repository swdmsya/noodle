class Post < ApplicationRecord
	#association
	belongs_to :genre, optional: true
	belongs_to :user, optional: true
	#activestorage
	has_one_attached :image

	#validation
	validates :user_id, presence: true
	#validates :impressions, presence: true
	validates :image, presence: true
end
