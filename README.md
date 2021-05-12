# テーブル設計

## users テーブル

| Column                   | Type   | Options      |
| ------------------------ | ------ | -----------  |
| id                       | string | null: false  |
| nickname                 | string | null: false  |
| email                    | string | unique: true |
| encrypted_password       | string | null: false  |


## furimas テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| image      | string | null: false |
| price      | string | null: false |
| saler      | string | null: false |
| buyer      | string | null: false |


## purchase_history テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| users     | references | null: false, foreign_key: true |
| furimas   | references | null: false, foreign_key: true |


## address テーブル

| Column           | Type    | Options     |
| ---------------- | ------  | ----------- |
| postal_code      | integer | null: false |
| prefecture       | string  | null: false |
| municipalities   | string  | null: false |
| building         | string  | null: false |
| telephone_number | string  | null: false |