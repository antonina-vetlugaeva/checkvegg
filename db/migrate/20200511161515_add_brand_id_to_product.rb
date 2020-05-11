class AddBrandIdToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :brand_id, :integer
  end
end
