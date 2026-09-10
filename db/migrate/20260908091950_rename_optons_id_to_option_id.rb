class RenameOptonsIdToOptionId < ActiveRecord::Migration[8.1]
  def change
    rename_column :option_values, :options_id, :option_id
    rename_column :variant_option_values, :variants_id, :variant_id
    rename_column :variant_option_values, :option_values_id, :option_value_id
  end
end
