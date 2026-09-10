class RenameCategoryToCategoryIdInTableName < ActiveRecord::Migration[8.1]
  def change
    rename_column :products, :category, :category_id
  end
end
