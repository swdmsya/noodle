class Shop < ApplicationRecord
  #associations
  has_many :shops
  has_many :users, through: :shops

  #validation
  validates :name, presence: true
  validates :address, presence: true
  validates :url, presence: true
end
