class AddTypeIdToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :type_id, :integer
  end
end
