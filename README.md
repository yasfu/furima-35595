# README

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nick_name       | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_year      | date   | null: false |
| birth_month     | date   | null: false |
| birth_day       | date   | null: false |
| zip_code        | string | null: false |
| prefecture      | string | null: false |
| city            | string | null: false |
| district        | string | null: false |
| address         | string | null: false |
| building        | string |             |
| phone_number    | string | null: false |

### Association

-belongs_to :product
-belongs_to :order
-belongs_to :destination

## productsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | int        | null: false                    |
| fee              | int        |                                |
| profit           | int        |                                |
| description      | text       | null: false                    |
| shipping_charges | int        | null: false                    |
| category         | string     | null: false                    |
| sate             | text       | null: false                    |
| days_to_ship     | date       | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

-has_many :users
-has_one :order
-has_one :destination

## orderテーブル

| Column   | Type       | Options  
| -------- | ---------- | ------------------------------ |
| comment  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| product  | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :product
-has_one :destination

## destinationsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| product | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| order   | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :order
-belongs_to :product