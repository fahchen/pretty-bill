class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name, limit: 255, null: false
      t.string :tel, limit: 255, null: false
      t.string :email, limit: 255, null: false

      t.timestamps null: false
    end
  end
end
