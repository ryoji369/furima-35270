# テーブル設計

## users テーブル

| Column           | Type         |   Options   |
| -----------------| -------------| ----------- |
| email            | string       | null: false |
| password         | string       | null: false |
| nickname         | string       | null: false |
| last_name        | string       | null: false |
| first_name       | string       | null: false |
| last_name_kana   | string       | null: false |
| first_name_kana  | string       | null: false |
| birthday         | integer      | null: false |

### Association

- has_many :items
- has_one :addresses 

## items テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |  
| name            | string     | null: false       | 
| text            | text       | null: false       | 
| status          | integer    | null: false       |
| price           | integer    | null: false       |
|shipping_charges | integer    | null: false       |
|shipping_date    | integer    | null: false       |
|prefecture_id    | integer    | null: false       |
|seller_id        | references | foreign_key: true |
|buyer_id         | references | foreign_key: true |
|category_id      | references | foreign_key: true |

### Association

- belongs_to :users


## buyers テーブル

| Column    | Type       | Options                 |
| --------- | ---------- | ----------------------- |
| last_name       | string     | null: false       |
| first_name      | string     | null: false       |
| last_name_kana  | string     | null: false       |
| first_name_kana | string     | null: false       |
| user_id         | references | foreign_key: true |
| prefecture_id   | integer    | null: false       |

### Association
- has_one :address


## addresses テーブル

| Column           | Type       | Options              |
| ---------------- | ---------- | -------------------- |
| postal_code      | string | null: false              |
| city             | string | null: false              |
| house_number     | string | null: false              |
| building_name    | string | null: false              |
| telephone_number | string | null: false              |

### Association
- belongs_to :users



