class ChangeProductIngridientsToIngridientsProducts < ActiveRecord::Migration[6.0]
  def change
    rename_table :product_ingridients, :ingridients_products
  end
end
