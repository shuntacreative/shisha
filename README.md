# README

## users テーブル

| Column             | Type    | Options                   |
| ----------         | ------  | -----------               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| birthday           | date    | null: false               |  

### Association

- has_many :posts, dependent: :destroy
- has_many :likes
- has_many :comments


## comments テーブル

| Column             | Type       | Options                        |
| ----------         | ------     | -----------                    |
| comment            | text       |                                |
| post               | references | foreign_key: true, null: false |
| user               | references | foreign_key: true, null: false |

### Association

- belongs_to :user
- belongs_to :post


## posts テーブル

| Column             | Type       | Options                        |
| ----------         | ------     | -----------                    |
| title              | text       |                                |
| user               | references | foreign_key: true, null: false |

### Association

- belongs_to :user
- has_many :photos, dependent: :destroy
- has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
- has_many :comments, dependent: :destroy


## likes テーブル

| Column             | Type       | Options                        |
| ----------         | ------     | -----------                    |
| post               | references | foreign_key: true, null: false |
| user               | references | foreign_key: true, null: false |

### Association

- belongs_to :user
- belongs_to :post
- validates :user_id, uniqueness: { scope: :post_id }


## photos テーブル

| Column             | Type       | Options                        |
| ----------         | ------     | -----------                    |
| image              | string     | null: false                    |
| post               | references | foreign_key: true, null: false |

### Association

- belongs_to :post
- validates :image, presence: true


