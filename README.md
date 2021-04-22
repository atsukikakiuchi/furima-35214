# テーブル設計

## usersテーブル

| Column                | Type   | Options                  |
| --------------------- | ------ | ------------------------ |
| nickname              | string | null: false              |
| email                 | string | null: false unique: true |
| encrypted_password    | string | null: false              |
| last_name             | string | null: false              |
| last_name_katakana    | string | null: false              |
| first_name            | string | null: false              |
| first_name_katakana   | string | null: false              |
| birthday              | date   | null: false              |

### Association

- has_many :items
- has_many :payments 

## itemsテーブル

| Column                     | Type       | Options                       |
| -------------------------- | ---------- | ----------------------------- |
| name                       | string     | null: false                   |
| text                       | text       | null: false                   |
| price                      | integer    | null: false                   |
| category_id                | integer    | null: false                   |
| condition_id               | integer    | null: false                   |
| charges_id                 | integer    | null: false                   |
| area_id                    | integer    | null: false                   |
| estimated_shopping_date_id | integer    | null: false                   |
| user                       | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_one :payment

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
| postal_code    | string     | null: false                   |
| prefectures_id | integer    | null: false                   |
| municipalities | text       | null: false                   |
| house_number   | text       | null: false                   |
| building_name  | text       |                               |
| phone_number   | string     | null: false                   |
| payment        | references | null: false foreign_key: true |

### Association

- belongs_to :payment