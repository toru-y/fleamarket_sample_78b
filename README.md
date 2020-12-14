### README

# Tfreemarket_sample_59a
フリマアプリのクローンサイト。

## Description
フリマアプリのクローンサイト。誰でも簡単に売り買いが楽しめるフリマアプリの機能を再現したページ。 ユーザー登録、商品出品、商品購入などの機能が再現されていますが、実際の取引はできません。


## Features
- haml/SASS記法と、命名規則BEMを使ったマークアップ
- ウィザード形式を用いたユーザー登録フォーム
- SNS認証による新規登録、ログイン
- ajaxを使用した非同期処理
- pay.jpによる購入処理
- capistranoによるAWS EC2への自動デプロイ
- ActiveStorageを使用しAWS S3への画像アップロード
- RSpecを使った単体テスト

## Requirement
- Ruby 2.5.1
- Rails 5.2.3

## Installation
```
$ git clone https://github.com/tetzng/freemarket_sample_59a.git
$ cd freemarket_sample_59a
$ bundle install
```
## License
MIT

# table declare
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
- has_one :address

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

## addresses
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|building_name|string||
|phone_number|integer||
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
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
