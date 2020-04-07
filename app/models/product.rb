class Product < ApplicationRecord
  belongs_to :category
  belongs_to :type
  has_many :product_items
  has_many :favourite_items

  has_and_belongs_to_many :ingridients

  validates :name, uniqueness: true
end
