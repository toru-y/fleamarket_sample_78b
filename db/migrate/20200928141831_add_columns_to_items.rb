class AddColumnsToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :status, :boolean, default: true, null: false
    add_column :items, :brand, :string
  end
end
