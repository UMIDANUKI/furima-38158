# データベース設計

## Users table

|Column              |Type     |Options                  |
|------------------------------------------------------- |
| family_name        | string  | null: false             |
| first_name         | string  | null: false             |
| nickname           | string  | null: false             |
| email              | string  | null: false unique: true|
| encrypted_password | string  | null: false             |
| birthday           | date    | null: false             |

### Association
has_many :items
has_many :orders

## items table

|Column              |Type        |Options                         |
|------------------------------------------------------------------|  
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| time_required_id   | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :users
has_one :orders


## order table
| Column  | Type       | Options                        |
|------------------------------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
belongs_to :users
belongs_to :items
has_one :order_details

## order_detail table
|Column          |Type        |Options                          |
|-------------------------------------------------------------- |
| post_code      | integer     | null: false                    |
| prefecture_id  | integer     | null: false                    |
| municipalities | string      | null: false                    |
| address        | string      | null: false                    |
| buildings      | string      |                                |
| phone_number   | string      | null: false                    |
| order          | references  | null: false, foreign_key: true |

### Association
belongs_to :orders