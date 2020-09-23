class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :size
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :handling_time
  has_many :images
  accepts_nested_attributes_for :images

  validates :name, :price, :description, :prefecture, :condition, :shipping_fee, :handling_time,  presence: true  
end
