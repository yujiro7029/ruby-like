module ApplicationHelper

  # tweets/showのいいねのカウント
  def like_judgment
    if Like.find_by(user_id:current_user&.id,tweet_id: @tweet.id)
      link_to @tweet.likes.count,"/likes/#{@tweet.id}/create",method: :delete,id:"like_judgment"
    else 
      link_to @tweet.likes.count,"/likes/#{@tweet.id}/create",method: :post,id:"like_judgment"
    end
  end

  # tweets/show不適切な問題の報告
  def flag_list
    if Flag.find_by(user_id:current_user&.id,tweet_id: @tweet.id)
      p "報告済み"
    else
      link_to "報告","/flags/#{@tweet.id}/new",id:"flag_judgment"
    end
  end
end
