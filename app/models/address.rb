class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  validates :post_code, :prefecture_id, :city, :house_number, presence: true
  validates :user_id, presence: false
end
