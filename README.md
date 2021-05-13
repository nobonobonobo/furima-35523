# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_ruby   | string | null: false               |
| first_name_ruby    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :furimas
- has_many :purchase_histories



## furimas テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_history



## purchase_history テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| furima    | references | null: false, foreign_key: true |

### Association

- belongs_to :furima
- belongs_to :user
- has_one :address


## address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| house_number     | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |

### Association

- has_one :furima
