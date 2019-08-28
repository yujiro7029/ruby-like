# アプリの目的
Rubyの問題文をクイズ形式で出し合い理解を深めるアプリケーション。
単語帳のように気軽に使う事ができ、覚えて置きたいメソッドや型を隙間時間に学習するができます。

# 作成の背景

学習効率をあげるには<アウトプット>が重要と理解しています。
自身で学んだ内容を考えて投稿する事で知識が定着し、学習効率をアップさせるだけでなく、他ユーザーが投稿した問題を回答する事で、知識の向上も期待できます。


# アプリの仕様
- ユーザーの新規登録、ログイン,編集、削除機能
- 問題を(選択式)または(記述式)を選び投稿、削除、編集機能
- 投稿された問題の種別に合わせて回答機能
- 投稿された問題に対してのいいね機能
- 投稿された問題に対してコメント機能
- 検索機能
- 投稿された問題の正答率、回答数表示機能
- 不適切な問題の報告機能（違反者通告機能）
- レスポンシブ対応(headerや一覧表示など)


# usersテーブル deviseを使用

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique: true|
|image|string||

### Association
- has_many :comments
- has_many :likes
- has_many :flags
- has_many :tweets
- has_many :answers
- has_many :answer_results

# tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|point|text|null: false|
|answer|text|null: false|
|title|string|null: false|
|type_problem|integer|null: false|
|select_problem1|string|null: false|
|select_problem2|string|null: false|
|select_problem3|string|null: false|
|select_problem4|string|null: false|
|select_problem5|string|null: false|
|judge_problem1|integer|null: false|
|judge_problem2|integer|null: false|
|judge_problem3|integer|null: false|
|judge_problem4|integer|null: false|
|judge_problem5|integer|null: false|
|user_id|references|null: false, foreign_key: true|



### Association
- has_many :answers
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :flags
- has_many :answer_results
- belongs_to :user


# answersテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|judge_problem1|integer|null: false|
|judge_problem2|integer|null: false|
|judge_problem3|integer|null: false|
|judge_problem4|integer|null: false|
|judge_problem5|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|tweet_id|references|null: false, foreign_key: true|



### Association

- belongs_to :tweet
- belongs_to :user
- has_many :answer_results

# answer_resultsテーブル

|Column|Type|Options|
|------|----|-------|
|result|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|tweet_id|references|null: false, foreign_key: true|
|answer_id|references|null: false, foreign_key: true|



### Association

- belongs_to :tweet
- belongs_to :user
- belongs_to :answer

# commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|references|null: false, foreign_key: true|
|tweet_id|references|null: false, foreign_key: true|

### Association
- belong_to :user
- belong_to :tweet

# likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|tweet_id|references|null: false, foreign_key: true|

### Association
- belong_to :user
- belong_to :tweet

# flagsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|tweet_id|references|null: false, foreign_key: true|

### Association
- belong_to :user
- belong_to :tweet
