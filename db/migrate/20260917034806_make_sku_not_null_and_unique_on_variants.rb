class MakeSkuNotNullAndUniqueOnVariants < ActiveRecord::Migration[8.0]
  def change
    change_column_null :variants, :sku, false
    add_index :variants, :sku, unique: true
  end
end
