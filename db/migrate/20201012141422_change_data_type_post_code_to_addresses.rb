class ChangeDataTypePostCodeToAddresses < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :post_code, :string
  end
end
