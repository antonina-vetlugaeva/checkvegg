class Favourite < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :products
  has_many :favourite_items
end
