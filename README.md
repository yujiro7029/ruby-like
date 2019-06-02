#アプリの目的
rubyの問題文をクイズ形式で出し合い理解を深めるゲーム(自分で使いたいから)
単語帳のように気軽に使う事ができ、覚えて置きたいメソッドや型を理解できる


#アプリの使用
(1)ユーザーが問題を投稿、削除、編集ができる
(2)ユーザーが問題をとく事ができる
(3)ユーザーが答えとその問題のポイントをしる事ができる
(4)ユーザーが問題の評価ができる
(5)投稿に対してコメントができる
(6)rubyコードに対応した投稿画面である
(7)人気ランキング表示機能
(8)ユーザーがといた問題が表示できる機能
(9)投稿したユーザーのみが編集と削除ができる


#追加実装して行きたい内容
.あなたにオススメの問題として表示する(タグ付けをする機能がいる)
.コメント機能の非同期通信
.問題文投稿のインクルメンタルサーチ機能
.問題文をnetに転がっている引っ張ってくる機能（API）


# usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :tweets
- has_many :comments
- has_many :likes

# tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|point|text|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- has_many :comments
- has_many :evaluations
- belong_to :user


# commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|tweet_id|references|null: false, foreign_key: true|

### Association
- belong_to :user
- belong_to :tweet

# evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|evaluation|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|tweet_id|references|null: false, foreign_key: true|


### Association
- belongs_to :tweet
- belongs_to :user

