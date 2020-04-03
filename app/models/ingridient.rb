class Ingridient < ApplicationRecord
  has_many :products, through: :ingridients_products;

  validates :name, uniqueness: true
end
