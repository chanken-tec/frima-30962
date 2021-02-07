# README

## usersテーブル

| Column                   | Type     | Options                        |
| ------------------------ | -------- | ------------------------------ |
| nickname                 | string   | null: false, foreign_key: true |
| mail_address             | string   | null: false, foreign_key: true |
| password                 | string   | null: false, foreign_key: true |
| password_confirmation    | string   | null: false, foreign_key: true |
| first_name               | string   | null: false, foreign_key: true |
| first_name_ruby          | string   | null: false, foreign_key: true |
| last_name                | string   | null: false, foreign_key: true |
| last_name_ruby           | string   | null: false, foreign_key: true |
| birthday                 | date     | null: false, foreign_key: true |


### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| information   | text       | null: false, foreign_key: true |
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
| user_id          | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| post_cord        | string  | null: false, foreign_key: true |
| prefecture       | string  | null: false, foreign_key: true |
| city             | string  | null: false, foreign_key: true |
| address          | string  | null: false, foreign_key: true |
| building_name    | string  | foreign_key: true              |
| phone_number     | string  | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_many :items

## purchase_history

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase


