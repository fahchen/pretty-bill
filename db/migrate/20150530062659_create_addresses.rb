class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :zip_code, limit: 255, null: false
      t.string :detail, limit: 255

      t.timestamps null: false
    end
  end
end
