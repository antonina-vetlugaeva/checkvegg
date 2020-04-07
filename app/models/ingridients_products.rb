class IngridientsProducts < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :ingridient, optional: true
  has_many :product_items
end
