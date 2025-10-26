# README

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| lastname_kanji     | string  | null: false |
| firstname_kanji    | string  | null: false |
| lastname_katakana  | string  | null: false |
| firstname_katakana | string  | null: false |
| birth_date         | date    | null: false |


### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| product_name       | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| product_status_id  | integer    | null: false |
| delivery_cost_id   | integer    | null: false |
| delivery_place_id  | integer    | null: false |
| delivery_time_id   | integer    | null: false |
| product_price      | integer    | null: false |
| user               | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| product   | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address


## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| purchase      | references | null: false, foreign_key: true |
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building      | string     |             |
| phone_number  | string     | null: false |


### Association

- belongs_to :purchase