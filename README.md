# README

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false, unique: true |
| lastname_kanji     | string  | null: false |
| firstname_kanji    | string  | null: false |
| lastname_katakana  | string  | null: false |
| firstname_katakana | string  | null: false |
| birth_date         | integer | null: false |


### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| product_name       | string     | null: false |
| product_price      | integer    | null: false |
| description        | text       | null: false |
| user               | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| address   | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase
- has_one :address


## addresses テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | integer    | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| address      | string     | null: false |


### Association

- belongs_to :purchase