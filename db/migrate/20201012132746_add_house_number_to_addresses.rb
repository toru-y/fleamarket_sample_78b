class AddHouseNumberToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :house_number, :string
  end
end
