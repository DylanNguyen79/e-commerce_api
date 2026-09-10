class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description 
      t.string :image_url
      t.decimal :price
      t.bigint :category_id

      t.timestamps
    end
  end
end
