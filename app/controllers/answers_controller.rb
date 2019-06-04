class AnswersController < ApplicationController
  
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.create(answer_params)
    redirect_to action: :show
  end


  def show
 @tweet =  Tweet.find(params[:tweet_id])
#  @answer = Answer.find(params[:tweet_id]) 
  end
end


private

def answer_params
params.require(:answer).permit(:content, :tweet_id).merge(tweet_id: params[:tweet_id])
end
