class Post < ApplicationRecord
	#association
	belongs_to :genre
	belongs_to :user

	#activestorage
	has_one_attached :image
	#validation
	validates :genre_id, acceptance: true
	validates :user_id, presence: true
end
