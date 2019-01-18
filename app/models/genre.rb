class Genre < ApplicationRecord
    #association
    has_many :posts
    has_many :shops, through: :posts
end
