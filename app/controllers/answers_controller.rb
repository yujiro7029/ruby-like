class AnswersController < ApplicationController
  
 def index   
 end
  
  def show
    @answer = Answer.find(params[:id])
    @tweet = Tweet.find(params[:tweet_id])
  end
  

  def new
    @answer = Answer.new
    @tweet = Tweet.find(params[:tweet_id])
    @answer.tweet_id = @tweet.id
  end


  def create
    @answer = Answer.create(answer_params)
    redirect_to tweet_answer_path(@answer.tweet_id,@answer.id)
  end

private

  def answer_params
   params.require(:answer).permit(:content, :tweet_id).merge(tweet_id: params[:tweet_id])
  end

end



