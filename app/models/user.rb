class User < ApplicationRecord
  has_many :favourites
  has_many :favourite_items, through: :favorites, source: :product
end
