class ProductIngridient < ApplicationRecord
  belongs_to :ingridient
  belongs_to :product
end
