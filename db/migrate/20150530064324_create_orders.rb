class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :merchant, index: true, foreign_key: true
      t.belongs_to :customer, index: true, foreign_key: true
      t.decimal :total_cost, :price, precision: 8, scale: 2, default: 0.0
      t.datetime :transacted_at

      t.timestamps null: false
    end
  end
end
