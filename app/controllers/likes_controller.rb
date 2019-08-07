class LikesController < ApplicationController
  before_action :set_tweet,only:[:create,:destroy]

  def create
    like = Like.new(user_id:current_user&.id,tweet_id: @tweet.id)
    like.save
    redirect_to tweet_path(@tweet.id)
  end

  def destroy
    like = Like.find_by(user_id:current_user&.id,tweet_id:@tweet.id)
    like.destroy
    redirect_to tweet_path(@tweet.id)
  end

private
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
