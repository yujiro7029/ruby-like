module TweetsHelper

  # 検索結果にて表示の切り替え
  def search_judgment
    "#{@problems} の検索結果" if  @tweet_search.present?
  end

  def search_count
    p "#{ @tweet_search.count}件表示" if  @tweet_search.present?
  end
end