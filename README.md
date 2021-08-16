# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birthday           | string | null: false |
| address            | string | null: false |


### Association

- has_many :items
- has_many :comments
- has_one :buys

## itmes テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| text        | string     | null: false                    |
| image       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :comments

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                   |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users

## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :shoppings_address

## shoppings address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :buys