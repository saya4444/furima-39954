# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| fast               | string | null: false |
| last               | string | null: false |
| fast_read          | string | null: false |
| last_read          | string | null: false |
| birth              | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | string     | null: false                    |
| explanation  | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| burden_id    | integer    | null: false                    |
| pref_id      | integer    | null: false                    |
| days_id      | string     | null: false                    |
| price        | integer    | null: false                    |
| users        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| price  | references | null: false, foreign_key: true |
| users  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column    | Type    | Options     |
| --------- | ------- | ------------|
| post_code | string  | null: false |
| pref_id   | integer | null: false |
| munic     | string  | null: false |
| address   | string  | null: false |
| building  | string  |             |
| tel       | string  | null: false |

### Association

- belongs_to :order