class Ingridient < ApplicationRecord
  has_and_belongs_to_many :products
  has_many :product_items

  validates :name, uniqueness: true
end
