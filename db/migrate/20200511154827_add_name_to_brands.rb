class AddNameToBrands < ActiveRecord::Migration[6.0]
  def change
    add_column :brands, :name, :string
  end
end
