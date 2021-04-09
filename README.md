# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
-has_many :products
-has_many :orders


## addressesテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| order           | references | null: false, foreign_key: true |
| postcode        | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| block           | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |

### Association
-belongs_to :order


## ordersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| product         | references | null: false, foreign_key: true |

### Association
-belongs_to :user
-belongs_to :product
-has_one    :address


## productsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| quality_id         | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |

### Association
-belongs_to :user
-has_one    :order