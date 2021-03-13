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
-has_one  :address
-has_one  :credit_card

## address
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

## credit_cardsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |

### Association
-belongs_to :user

## productsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| quality         | string     | null: false                    |
| price           | integer    | null: false                    |

### Association

-belongs_to :user
-has_one :delivery

## deliveryテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| products_id     | references | null: false, foreign_key: true |
| delivery_fee    | string     | null: false                    |
| delivery_days   | string     | null: false                    |
| delivery_source | string     | null: false                    |

### Association

-belongs_to :product