class Shop < ApplicationRecord
  #associations
  has_many :shops
  has_many :users, through: :shops
end
