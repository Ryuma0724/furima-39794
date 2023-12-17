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
|name_kana | string |null:false|
|birthday | integer |null:false|

# Association

- has_many : items
- has_many : orders
- has_many : addresses

# items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
|Image| string |null:false|
|Item_name | string |null:false|
|text | text |null:false|
|name | string |null:false|
|category|string|null:false|
|condition | string |null:false|
|delivery_charge | string |null:false|
|shipping_area | string |null:false|
|lead_time | integer |null:false|
|price | integer |null:false|

# Association

- belongs_to : users
- belongs_to : orders
- belongs_to : addresses

# orders テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
|buyer| string |null:false|
|seller | string |null:false|
|Item_name | string |null:false|
|address | string |null:false|
|price | integer |null:false|

# Association

- belongs_to : users
- belongs_to : items
- belongs_to : addresses

# addresses テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
|address| string |null:false|
|Item_name | string |null:false|
|order_date | integer |null:false|
|delivery_date | integer |null:false|

# Association

- belongs_to : users
- belongs_to : items
- belongs_to : orders