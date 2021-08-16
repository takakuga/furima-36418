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
- has_one :buys

## items テーブル

| Column       | Type       | Options                        |
| ------       | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| text         | string     | null: false                    |
| image        | string     | null: false                    |
| item_detail  | string     | null: false                    |
| delivery     | string     | null: false                    |
| price        | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :users


## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :shoppings_address

## shoppings address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| send_address | string     | null: false,                   |
| telephone    | string     | null: false,                   |

### Association

- belongs_to :buys