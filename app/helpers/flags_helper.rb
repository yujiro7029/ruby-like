module FlagsHelper

  def flag_judgment
    if Flag.find_by(user_id:current_user&.id,tweet_id: @tweet.id)
      p "報告済"
    else
      link_to "送信する","/flags/#{@tweet.id}/create",method: :post,class:"flag-buttom"
    end
  end


end
