# テーブル設計

## usersテーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| last name             | string | null: false |
| last name katakana    | string | null: false |
| first name            | string | null: false |
| first name katakana   | string | null: false |
| birthday              | date   | null: false |

### Association

- has_many :items
- has_many :payments
- has_one :address
- 

## itemsテーブル

| Column                  | Type       | Options                       |
| ----------------------- | ---------- | ----------------------------- |
| name                    | text       | null: false                   |
| text                    | text       | null: false                   |
| price                   | int        | null: false                   |
| category                | text       | null: false                   |
| condition               | text       | null: false                   |
| charges                 | string     | null: false                   |
| area                    | string     | null: false                   |
| estimated shopping date | text       | null: false                   |
| user                    | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_one :payment
- has_one :address

## paymentテーブル

| Column      | Type       | Options                       |
| ----------- | -------    | ----------------------------- |
| user        | references | null: false foreign_key: true |
| item        | references | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressテーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| postal code    | int        | null: false                   |
| prefectures    | string     | null: false                   |
| municipalities | text       | null: false                   |
| house number   | text       | null: false                   |
| building name  | text       | null: false                   |
| phone number   | int        | null: false                   |
| user           | references | null: false foreign_key: true |

### Association

- has_one :user
- has_one :item
- has_one :payment