＃テーブル設計

## users テーブル

| Column                | Type        | Options                     |
| --------------------- | ----------- | --------------------------- |
| nickname              | string      | null: false                 |
| email                 | string      | null: false, unique: true   |
| encrypted_password    | string      | null: false                 |
| last_name             | string      | null: false                 |
| first_name            | string      | null: false                 |
| last_name_kana        | string      | null: false                 |
| first_name_kana       | string      | null: false                 |
| birthday              | date        | null: false                 |

### Association
- has_many :items
- has_many :purchase_histories

## items テーブル
| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| name                 | string      | null: false                    |
| information          | text        | null: false                    |
| category_id          | integer     | null: false                    |
| condition_id         | integer     | null: false                    |
| shipping_charge_id   | integer     | null: false                    |
| prefecture_id        | integer     | null: false                    |
| lead_time_id         | integer     | null: false                    |
| price                | integer     | null: false                    |
| user                 | references  | null: false, foreign_key: true |       

### Association
- belongs_to :user
- has_one :purchase_history

## purchase_histories テーブル
| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| user                 | references  | null: false, foreign_key: true | 
| item                 | references  | null: false, foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_detail

## shipping_details テーブル
| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| postal_code          | string      | null: false                    |
| prefecture_id        | integer     | null: false                    |
| city                 | string      | null: false                    |
| address              | string      | null: false                    |
| apartment            | string      |                                |
| phone_number         | string      | null: false                    |
| purchase_history     | references  | null: false, foreign_key: true | 

### Association
- belongs_to :purchase_history