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

### Association

-has_many :products
-has_many :orders

## productsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| price               | int        | null: false                    |
| description         | text       | null: false                    |
| shipping_charges_id | int        | null: false, foreign_key: true |
| category_id         | int        | null: false, foreign_key: true |
| state_id            | int        | null: false, foreign_key: true |
| days_to_ship_id     | int        | null: false, foreign_key: true |
| prefecture_id       | int        | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

-belongs_to :user
-has_one :order

## addressテーブル

| Column        | Type       | Options  
| ------------- | ---------- | ------------------------------ |
| zip_code      | string     | null: false                    |
| prefecture_id | int        | null: false, foreign_key: true |
| city          | string     | null: false                    |
| district      | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

-belongs_to :order

## orderテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| product             | references | null: false, foreign_key: true |

### Association

-belongs_to :product
-belongs_to :user
-has_one :address