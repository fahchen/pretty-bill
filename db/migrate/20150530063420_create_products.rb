class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, limit: 255, null: false
      t.decimal :price, precision: 8, scale: 2, default: 0.0
      t.string :unit, default: '个'

      t.timestamps null: false
    end
  end
end
