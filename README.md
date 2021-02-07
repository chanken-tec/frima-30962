# README

## usersテーブル

| Column                   | Type     | Options     |
| ------------------------ | -------- | ----------- |
| nickname                 | string   | null: false |
| email                    | string   | null: false |
| encrypted_password       | string   | null: false |
| first_name               | string   | null: false |
| first_name_ruby          | string   | null: false |
| last_name                | string   | null: false |
| last_name_ruby           | string   | null: false |
| birthday                 | date     | null: false |


### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| information      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| post_cord        | string  | null: false |
| prefecture       | string  | null: false |
| city             | string  | null: false |
| address          | string  | null: false |
| building_name    | string  |             |
| phone_number     | string  | null: false |


### Association
- belongs_to :user
- has_many :items
- 

## purchase_history

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| item     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :purchase


