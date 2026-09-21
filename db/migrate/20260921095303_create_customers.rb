class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :status, null: false, default: "active"

      t.timestamps
    end
  end
end
