class AddSerialNumberToProductItem < ActiveRecord::Migration[6.0]
  def change
    add_column :product_items, :serial_number, :string
  end
end
