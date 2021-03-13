# テーブル設計

## usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association
-has_many :products
-has_one  :addresses
-has_many :backgrounds


## addressesテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| postcode        | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| block           | string     | null: false                    |
| building        | string     | null: false                    |
| phone_number    | string     | null: false                    |

### Association
-belongs_to :user


## backgroundsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| product_id      | references | null: false, foreign_key: true |

### Association
-belongs_to :user
-belongs_to :products


## productsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| quality_id         | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    |
| delivery_days_id   | integer    | null: false                    |
| delivery_source_id | integer    | null: false                    |

### Association
-belongs_to :user