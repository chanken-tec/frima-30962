# README

## usersテーブル

| Column                   | Type     | Options                   |
| ------------------------ | -------- | ------------------------- |
| nickname                 | string   | null: false               |
| email                    | string   | null: false, unique: true |
| encrypted_password       | string   | null: false               |
| first_name               | string   | null: false               |
| first_name_ruby          | string   | null: false               |
| last_name                | string   | null: false               |
| last_name_ruby           | string   | null: false               |
| birthday                 | date     | null: false               |


### Association
- has_many :items
- has_many :purchase_histories

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| information      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase_history

## purchasesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_cord        | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |
| shipping_area_id | integer    | null: false                    |


### Association
- belongs_to :purchase_history

## purchase_histories

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| item     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :purchase


