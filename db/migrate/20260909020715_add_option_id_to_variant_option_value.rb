class AddOptionIdToVariantOptionValue < ActiveRecord::Migration[8.1]
  def change
    add_reference :variant_option_values, :option, type: :bigint, null: false
  end
end
