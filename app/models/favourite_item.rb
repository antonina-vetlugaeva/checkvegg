class FavouriteItem < ApplicationRecord
  belongs_to :favourite
  belongs_to :user
end
