# テーブル設計

## users テーブル（ユーザー情報）

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :buys

## items テーブル（商品情報）

| Column             | Type        | Options                        |
| -------------------| ----------  | ------------------------------ |
| user               | references  | null: false, foreign_key: true |
| product_name       | string      | null: false                    |
| description        | text        | null: false                    |
| state_id           | integer     | null: false                    |
| prefecture_id      | integer     | null: false                    |
| postage_id         | integer     | null: false                    |
| price              | integer     | null: false                    |
| day_delivery_id    | integer     | null: false                    |
| category_id        | integer     | null: false                    |



### Association

- belongs_to :user
- has_one :buy



## buys テーブル（購入者情報）

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :residence

## residences テーブル (配送先住所)

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| buy           | references | null: false, foreign_key: true |
| postal_code   | string     | null: false,                   |
| prefecture_id | integer    | null: false,                   |
| address       | string     | null: false,                   |
| city          | string     | null: false,                   |
| building_name | string     |                                |
| phone_number  | string     | null: false,                   |

### Association

- belongs_to :buy