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
| charge_id                  | integer    | null: false                   |
| prefecture_id              | integer    | null: false                   |
| estimated_shopping_date_id | integer    | null: false                   |
| user                       | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_one :payment

## paymentsテーブル

| Column      | Type       | Options                       |
| ----------- | -------    | ----------------------------- |
| user        | references | null: false foreign_key: true |
| item        | references | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| postal_code    | string     | null: false                   |
| prefecture_id  | integer    | null: false                   |
| municipality   | string     | null: false                   |
| house_number   | string     | null: false                   |
| building_name  | string     |                               |
| phone_number   | string     | null: false                   |
| payment        | references | null: false foreign_key: true |

### Association

- belongs_to :payment