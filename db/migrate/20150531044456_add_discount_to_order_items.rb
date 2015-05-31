class AddDiscountToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :discount, :decimal, precision: 8, scale: 2, default: 1.0
  end
end
