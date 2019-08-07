class FlagsController < ApplicationController

  def new

    @flag = Flag.new
    @tweet = Tweet.find(params[:tweet_id])
   
  end

  def create
    flag = Flag.new(user_id:current_user&.id,tweet_id: params[:tweet_id])
    check_id = flag.user_id
    if   check_id  == nil
      redirect_to tweet_path(params[:tweet_id])
    else flag.save
      redirect_to tweet_path(params[:tweet_id])
    end
  end

end
