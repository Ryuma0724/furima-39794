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
|email | string |unique:true|
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
|id |integer |null:false|
|title | string |null:false|
|text | content |null:false|
|genre_id | integer |null:false|
|created_at | date |null:false|
|updated_at | date |null:false|

# Association

- belongs_to : user
- has_one : orders
- belongs_to : address

# orders テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
|user| reference |null:false, foreign_key: true|
|item| reference |null:false, foreign_key: true|

# Association

- belongs_to : user
- belongs_to : item
- has_one : addresses

# addresses テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
|zip_code| string |null:false|
|prefecture| string |null:false|
|municipalities| string |null:false|
|street| string |null:false|
|building| string |        |
|phone_number | integer |null:false|

# Association

- belongs_to : order