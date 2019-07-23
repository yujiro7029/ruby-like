module TweetsHelper

  def hoge
    link_to edit_tweet_path(@tweet.id),class:"problem-box__option__box"
  end
end