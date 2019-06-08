namespace :task_sample do
  desc "ユーザーの入店情報をリセットする"
  task reset_entered_flag: :environment do
    User.update.all(entered_flag: false)
  end
end
