class CreateOptionValues < ActiveRecord::Migration[8.1]
  def change
    create_table :option_values do |t|
      t.string :values, null: false
      t.bigint :options_id, null: false

      t.timestamps
    end
  end
end
