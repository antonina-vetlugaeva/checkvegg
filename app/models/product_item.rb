class ProductItem < ApplicationRecord
  belongs_to :product
  belongs_to :ingridient
  has_many :favourite_items
end
