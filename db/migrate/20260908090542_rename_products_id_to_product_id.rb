class RenameProductsIdToProductId < ActiveRecord::Migration[8.1]
  def change
    rename_column :variants, :products_id, :product_id
  end
end
