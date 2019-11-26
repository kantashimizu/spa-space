# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :comment
- has_many :tweet

## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|string|null: false|
|image|string||
|address|string|null: false|
|user_id|references|null: false,foreign_key: true|
|area_id|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- has_many :comment

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|tweet_id|references|null: false,foreign_key: true|
|text|string|null: false|

### Association
- belongs_to :tweet
- belongs_to :user

## areasテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string||


### Association
- belongs_to :tweet
