module TweetsHelper

  # 検索結果にて表示の切り替え
  def search_judgment
    "#{@problems} の検索結果" if  @tweet_search.present?
  end

  def search_count
    p "#{ @tweet_search.count}件表示" if  @tweet_search.present?
  end


  # tweet/showの表示の際に利用
  def type_judge
    if @tweet.type_problem == 1
      p "記述問題"
    else
      p "選択問題"
    end
  end

end