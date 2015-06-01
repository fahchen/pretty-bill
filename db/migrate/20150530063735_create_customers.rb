class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, limit: 255, null: false
      t.string :phone, limit: 255, null: false
      t.integer :gender, default: 0

      t.timestamps null: false
    end
  end
end
