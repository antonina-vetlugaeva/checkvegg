class Product < ApplicationRecord
  belongs_to :category
  belongs_to :type

  has_many :favorite_items

  has_many :ingridients_products
  has_many :ingridients, through: :ingridients_products

  validates :name, uniqueness: true
end
