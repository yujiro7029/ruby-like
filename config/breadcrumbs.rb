
# crumb :root do
#   link "HOME", root_path
# end

# #tweets/edit
# crumb :tweet_edit do |edit|
#   link "#{edit.title}を編集",edit_tweet_path
# end

# #tweets/show
# crumb :tweet_show do |tweet|
#   link "#{tweet.title}の詳細",tweet_path(tweet.id)
# end

# #comments/new
# crumb :comment_show do |tweet|
#   link "新規コメント",new_tweet_comment_path  
#   parent :tweet_show, tweet
# end

# #comments/index
# crumb :comment_index do |tweet|
#   link "コメント一覧", tweet_comments_path 
#   parent :tweet_show, tweet
# end

# #answers/new
# crumb :answer_new do |tweet|
#   link "問題を回答", new_tweet_answer_path 
#   parent :tweet_show,tweet
# end

# #answers/judge
# crumb :answer_new do |tweet|
#   link "答え合わせ", new_tweet_answer_path 
#   parent :tweet_show,tweet
# end

# #users/show
# crumb :user do |tweet|
#   link "マイページ", users_path 
# end

# #users/answer_question
# crumb :answer_question do
#   link "回答問題一覧",  answer_question_users_path 
#   parent :user
# end

# #users/like_list
# crumb :like_list do
#   link "いいね",  likes_list_users_path 
#   parent :user
# end

# #users/ansqwer
# crumb :answer do
#   link "投稿した問題の一覧",  likes_list_users_path 
#   parent :user
# end










# # crumb :project_issues do |project|
# #   link "Issues", project_issues_path(project)
# #   parent :project, project
# # end

# # crumb :issue do |issue|
# #   link issue.title, issue_path(issue)
# #   parent :project_issues, issue.project
# # end

# # If you want to split your breadcrumbs configuration over multiple files, you
# # can create a folder named `config/breadcrumbs` and put your configuration
# # files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# # folder are loaded and reloaded automatically when you change them, just like
# # this file (`config/breadcrumbs.rb`).