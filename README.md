# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## condition(active_hash)
|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|
### Association
- has_many :addresses
- has_many :items

## users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, uniqueness: true|
|email|string|null: false, uniqueness: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_date|date|null: false|
### Association
- has_many :purchases
- has_many :items
- has_many :comments
- belongs_to :credit_card

## credit_card
|Column|Type|Options|
|------|----|-------|
<!-- usersテーブルのid -->
|user|integer|null: false|
<!-- payjpの顧客id -->
|customer_id|string|null: false|
<!-- payjpのデフォルトカードid -->
|card_id|string|null: false|
### Association
- belongs_to :users

## comments(中間テーブル)
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|
|comment|text|null: false|
|created_at|timestamps|null: false|
### Association
- belongs_to :users
- belongs_to :items

## purchases
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|
### Association
- belongs_to :users
- belongs_to :items
- belongs_to :addresses

## addresses
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|user|reference|null: false, foreign_key: true|
|city|string|null: false|
|building_name|string||
|phone_number|integer||
|purchases|reference|null: false, foreign_key: true|
### Association
- belongs_to :purchases
- belongs_to :prefecture

## items
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|images_id|integer|null: false|
|size_id|integer|null: false|
|category_id|integer|null: false|
|condition_id|integer|null: false|
|shipping_fee_id|integer|null: false|
|handling_time_id|integer|null: false|
|prefecture_id|integer|null: false|
### Association
- has_many :comments
- has_many :images_id
- belongs_to :user
- belongs_to :size_id
- belongs_to :category_id
- belongs_to :shipping_fee_id
- belongs_to :handling_time_id
- belongs_to :prefecture_id
- belongs_to :purchases

## images
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|reference|null: false, foreign_key: true|
### Association
- belongs_to :items

## size(active_hash)
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
### Association
- has_many :items


## shipping_fee(active_hash)
|Column|Type|Options|
|------|----|-------|
|shipping_fee|string|null: false|
### Association
- has_many :items


## handling_time(active_hash)
|Column|Type|Options|
|------|----|-------|
|handling_time|string|null: false|
### Association
- has_many :items

## category(active_hash)
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
### Association
- has_many :items

## prefecture(active_hash)
|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|
### Association
- has_many :items
- has_many :addresses

