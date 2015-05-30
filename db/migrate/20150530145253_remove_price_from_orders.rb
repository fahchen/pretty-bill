class RemovePriceFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :price, :decimal, precision: 8, scale: 2, default: 0.0
  end
end
