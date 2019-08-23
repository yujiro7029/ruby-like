class LikesController < ApplicationController
  before_action :set_tweet,only:[:create,:destroy]

  def create
    respond_to do |format|
        like = Like.new(user_id:current_user&.id,tweet_id: @tweet.id)
        like.save
        format.html{redirect_to tweet_path(@tweet.id) }
        format.js
    end
   
   
  end

  def destroy
    respond_to do |format|
      like = Like.find_by(user_id:current_user&.id,tweet_id:@tweet.id)
      like.destroy
      format.html{redirect_to tweet_path(@tweet.id) }
      format.js
    end
  end

private
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
