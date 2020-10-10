class RenameColumnsToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :size, :size_id
    rename_column :items, :category, :category_id
    rename_column :items, :condition, :condition_id
    rename_column :items, :shipping_fee, :shipping_fee_id
    rename_column :items, :handling_time, :handling_time_id
    rename_column :items, :prefecture, :prefecture_id
  end
end
