class AddVariantPriceToVariant < ActiveRecord::Migration[8.0]
  def change
    add_column :variants, :variant_price, :decimal, null: false, default: 0
  end
end
