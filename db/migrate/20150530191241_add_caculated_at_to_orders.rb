class AddCaculatedAtToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :caculated_at, :datetime
  end
end
