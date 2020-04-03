class User < ApplicationRecord
  has_many :favourite_items
  has_many :favourites, through :favourite_items, source: :product
end
