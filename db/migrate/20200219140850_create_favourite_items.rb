class CreateFavouriteItems < ActiveRecord::Migration[6.0]
  def change
    create_table :favourite_items do |t|
      t.integer :favourite_id
      t.integer :product_id
      t.integer :product_item_id

      t.timestamps
    end
  end
end
