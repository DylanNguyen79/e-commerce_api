class AddForeignKeyToProducts < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :products, :categories
  end
end
