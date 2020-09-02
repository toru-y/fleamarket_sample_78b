class CreateLaboItems < ActiveRecord::Migration[6.0]
  def change
    create_table :labo_items do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :image
      t.string :category
      t.string :brand
      t.string :size
      t.string :condition
      t.string :postage_player
      t.string :prefecture
      t.string :handling_times

      t.timestamps
    end
  end
end
