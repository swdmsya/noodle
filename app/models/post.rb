class Post < ApplicationRecord
	#association
	belongs_to :genre, optional: true
	belongs_to :shop, optional: true
	belongs_to :user, optional: true

	#activestorage
	#has_one_attached :image
	#validation
	#validates :genre_id, acceptance: true
	validates :user_id, presence: true
end
