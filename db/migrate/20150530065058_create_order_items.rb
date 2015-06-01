class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.belongs_to :order, index: true, foreign_key: true
      t.belongs_to :product, index: true, foreign_key: true
      t.integer :quantity, default: 0
      t.decimal :total, :price, precision: 8, scale: 2, default: 0.0
      t.text :remark

      t.timestamps null: false
    end
  end
end
