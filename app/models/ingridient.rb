class Ingridient < ApplicationRecord
  has_many :product_ingridients
  has_many :products, through: :product_ingridients

  validates :name, uniqueness: true
end
