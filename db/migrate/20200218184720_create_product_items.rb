class CreateProductItems < ActiveRecord::Migration[6.0]
  def change
    create_table :product_items do |t|
      t.integer :product_id
      t.integer :category_id
      t.integer :ingridient_id

      t.timestamps
    end
  end
end
