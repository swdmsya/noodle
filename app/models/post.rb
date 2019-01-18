class Post < ApplicationRecord
	#association
	belongs_to :genre
	belongs_to :shop
	belongs_to :user
	
	#validation
end
