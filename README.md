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
| last_name_ruby           | string   | null: false, foreign_key: true |
| birthday                 | date     | null: false, foreign_key: true |


### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false, foreign_key: true |
| information   | text       | null: false, foreign_key: true |
| category      | string     | null: false, foreign_key: true |
| condition     | integer    | null: false, foreign_key: true |
| delivery_fee  | integer    | null: false, foreign_key: true |
| shipping_area | integer    | null: false, foreign_key: true |
| shipping_days | integer    | null: false, foreign_key: true |
| price         | integer    | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |


### Association
- belongs_to :users
- has_one :purchase

## purchasesテーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| post_cord        | integer | null: false, foreign_key: true |
| prefecture       | string  | null: false, foreign_key: true |
| city             | string  | null: false, foreign_key: true |
| address          | string  | null: false, foreign_key: true |
| building_name    | string  |                                |
| phone_number     | string  | null: false, foreign_key: true |


### Association
- belongs_to :users
- has_many :items

## purchase history

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |



