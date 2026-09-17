class AddSkuAndStockToVariants < ActiveRecord::Migration[8.0]
  def change
    add_column :variants, :sku, :string
    add_column :variants, :stock, :integer, null: false, default: 0
  end
end
