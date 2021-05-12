# テーブル設計

## users テーブル

| Column                   | Type   | Options     |
| ------------------------ | ------ | ----------- |
| id                       | string | null: false |
| nickname                 | string | null: false |
| email                    | string | null: false |
| password                 | string | null: false |
| password_confirmation    | string | null: false |

## furimas テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| image      | string | null: false |
| price      | string | null: false |
| saler      | string | null: false |
| buyer      | string | null: false |
