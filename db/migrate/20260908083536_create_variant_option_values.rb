class CreateVariantOptionValues < ActiveRecord::Migration[8.1]
  def change
    create_table :variant_option_values do |t|
      t.bigint :variants_id, null: false
      t.bigint :option_values_id, null: false

      t.timestamps
    end
  end
end
