class AddDefaultValueToZipCodeToAddresses < ActiveRecord::Migration
  def up
    change_column_default :addresses, :zip_code, '000000'
  end
  def down
    change_column_default :addresses, :zip_code, nil
  end
end
