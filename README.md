# README

# テーブル設計

## users テーブル

| Column                    | Type   | Options                   |
| ------------------------- | ------ | ------------------------- |
| nick_name                 | string | null: false               |
| email                     | string | null: false, unique: true |
| encrypted_password        | string | null: false               |
| last_name                 | string | null: false               |
| first_name                | string | null: false               |
| last_name_kana            | string | null: false               |
| first_name_kana           | string | null: false               |
| birthday                  | date   | null: false               |
| prefecture_id             | int    | null: false               |


### Association

-belongs_to :product
-belongs_to :order
-has_one :address

## productsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| price               | int        | null: false                    |
| description         | text       | null: false                    |
| shipping_charges_id | int        | null: false                    |
| category_id         | int        | null: false                    |
| sate_id             | int        | null: false                    |
| days_to_ship_id     | int        | null: false                    |

### Association

-has_many :users
-has_one :order
-belongs_to :address

## addressテーブル

| Column        | Type   | Options  
| ------------- | ------ | ------------------------- |
| zip_code      | string | null: false               |
| city          | string | null: false               |
| district      | string | null: false               |
| address       | string | null: false               |
| building      | string |                           |
| phone_number  | string | null: false               |
| prefecture_id | int    | null: false               |

### Association

-has_many :products
-belongs_to :user
-belongs_to :order

## orderテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| shipping_charges_id | int        | null: false                    |
| category_id         | int        | null: false                    |
| sate_id             | int        | null: false                    |
| days_to_ship_id     | int        | null: false                    |

### Association

-belongs_to :products
-has_many :user
-has_one :address