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
#　users テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
|nickname | string |null:false|
|email | string |null: false,unique:true|
|encrypted_password | string |null:false|
|family_name | string |null:false|
|given_name | string |null:false|
|family_name_kana | string |null:false|
|given_name_kana | string |null:false|
|birthday | date |null:false|

# Association

- has_many : items
- has_many : orders

# items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
|item_name | string |null:false|
|title | string |null:false|
|text | content |null:false|
|genre_id | integer |null:false|
|condition_id | integer |null:false|
|charge_id| integer |null:false|
|area_id | integer |null:false|
|lead_time_id | integer |null:false|
|price| integer |null:false|

# Association

- belongs_to : user
- has_one : order

# orders テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
|user| reference |null:false, foreign_key: true|
|item| reference |null:false, foreign_key: true|

# Association

- belongs_to : user
- belongs_to : item
- has_one : address

# addresses テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
|zip_code| string |null:false|
|prefecture_id| integer |null:false|
|municipality| string |null:false|
|street| string |null:false|
|building| string |        |
|phone_number | string |null:false|
|order| reference |null:false, foreign_key: true|

# Association

- belongs_to : order