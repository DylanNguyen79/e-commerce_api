class RenameProductCategoriesToCategories < ActiveRecord::Migration[8.0]
  def change
    rename_table :product_categories, :categories
  end
end
