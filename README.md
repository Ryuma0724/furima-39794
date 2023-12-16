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
|email | string |null:false|
|password | string |null:false|
|name | string |null:false|
|birthday | integer |null:false|

# Association

- has_many : items
- has_many : purchase_records

# items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
|item| string |null:false|
|id | string |null:false|
|comments | text |null:false|
|name | string |null:false|
|birthday | integer |null:false|

# Association

- belongs_to : users
- has_many : purchase_records

# purchase_record テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
|item| string |null:false|
|id | string |null:false|
|address | text |null:false|
|buyer_name | string |null:false|

# Association

- belongs_to : users
- belongs_to : items

