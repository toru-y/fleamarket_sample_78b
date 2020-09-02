json.extract! labo_item, :id, :name, :price, :description, :image, :category, :brand, :size, :condition, :postage_player, :prefecture, :handling_times, :created_at, :updated_at
json.url labo_item_url(labo_item, format: :json)
