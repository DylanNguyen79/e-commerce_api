class CreateVariants < ActiveRecord::Migration[8.1]
  def change
    create_table :variants do |t|
      t.bigint :products_id, null: false
      t.decimal :price

      t.timestamps
    end
  end
end
