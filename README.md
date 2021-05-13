# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| id                 | string | null: false               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_ruby   | string | null: false               |
| first_name_ruby    | string | null: false               |
| birthday           | string | null: false               |


## furimas テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| image         | string     | null: false                    |
| price         | string     | null: false                    |
| description   | string     | null: false                    |
| category      | string     | null: false                    |
| prefecture    | string     | null: false                    |
| condition     | string     | null: false                    |
| shipping_date | string     | null: false                    |
| postage       | string     | null: false                    |
| users         | references | null: false, foreign_key: true |


## purchase_history テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| users     | references | null: false, foreign_key: true |
| furimas   | references | null: false, foreign_key: true |

### Association

- has_many :furimas


## address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| municipalities   | string     | null: false                    |
| house number     | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |