class Genre < ApplicationRecord
    #association
    has_many :posts
end
