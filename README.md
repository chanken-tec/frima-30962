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
| birthday                 | integer  | null: false, foreign_key: true |


### Association
- has_many :items
- has_many :purchases, through: :items

## itemsテーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| name          | string  | null: false, foreign_key: true |
| image         | string  | null: false, foreign_key: true |
| information   | text    | null: false, foreign_key: true |
| category      | string  | null: false, foreign_key: true |
| condition     | string  | null: false, foreign_key: true |
| delivery_fee  | integer | null: false, foreign_key: true |
| shipping_area | string  | null: false, foreign_key: true |
| shipping_days | integer | null: false, foreign_key: true |
| price         | integer | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :purchases

## purchasesテーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| card_number      | integer | null: false, foreign_key: true |
| expiration_date  | integer | null: false, foreign_key: true |
| cvv              | integer | null: false, foreign_key: true |
| post_cord        | integer | null: false, foreign_key: true |
| prefecture       | string  | null: false, foreign_key: true |
| city             | string  | null: false, foreign_key: true |
| address          | string  | null: false, foreign_key: true |
| building_name    | string  |             |
| phone_number     | integer | null: false, foreign_key: true |


### Association
- belongs_to :users
- has_many :items, through: :users



