＃テーブル設計

## users テーブル

| Column                | Type        | Options                     |
| --------------------- | ----------- | --------------------------- |
| nickname              | string      | null: false, unique: true   |
| email                 | string      | null: false, unique: true   |
| password              | string      | null: false                 |
| password_confirmation | string      | null: false                 |
| last_name             | string      | null: false                 |
| first_name            | string      | null: false                 |
| last_name_kana        | string      | null: false                 |
| first_name_kana       | string      | null: false                 |
| birthday              | date        | null: false                 |

### Association
- has_many :items
- has_many :purchase_history

## items テーブル
| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| name                 | string      | null: false, unique: true      |
| information          | text        | null: false                    |
| category             | string      | null: false                    |
| condition            | string      | null: false                    |
| shipping_charge      | string      | null: false                    |
| shipping_area        | string      | null: false                    |
| lead_time            | string      | null: false                    |
| price                | integer     | null: false                    |
| user                 | references  | null: false, foreign_key: true |       

### Association
- belongs_to :user
- has_one :purchase_history

## purchase_history テーブル
| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| user                 | references  | null: false, foreign_key: true | 
| item                 | references  | null: false, foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_information

## shipping_information テーブル
| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| postal_code          | string      | null: false                    |
| prefecture           | text        | null: false                    |
| city                 | text        | null: false                    |
| address              | text        | null: false                    |
| apartment            | text        |                                |
| phone_number         | string      | null: false                    |
| purchase_history     | references  | null: false, foreign_key: true | 

### Association
- belongs_to :purchase_history