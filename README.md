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
- has_one :credit_card

## credit_card
|Column|Type|Options|
|------|----|-------|
<!-- usersテーブルのid -->
|user|references|null: false, foreign_key: true|
<!-- payjpの顧客id -->
|customer_id|string|null: false|
<!-- payjpのデフォルトカードid -->
|card_id|string|null: false|
### Association
- belongs_to :user

## comments(中間テーブル)
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|comment|text|null: false|
|created_at|timestamps|null: false|
### Association
- belongs_to :user
- belongs_to :item

## purchases
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture|references|null: false, foreign_key: true|
|city|string|null: false|
|building_name|string||
|phone_number|integer||
|purchases|references|null: false, foreign_key: true|
### Association
- belongs_to :purchases
- belongs_to :active_hash

## items
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|size|integer|null: false|
|category|integer|null: false|
|condition|integer|null: false|
|shipping_fee|integer|null: false|
|handling_time|integer|null: false|
|prefecture|integer|null: false|
### Association
- has_many :comments
- has_many :images
- belongs_to :user
- belongs_to :active_hash

## images
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :item

