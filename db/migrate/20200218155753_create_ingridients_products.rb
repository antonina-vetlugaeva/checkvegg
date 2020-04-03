class CreateIngridientsProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :ingridients_products do |t|
      t.integer :ingridient_id
      t.integer :product_id
    end
  end
end
