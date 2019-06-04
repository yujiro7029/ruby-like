class AnswersController < ApplicationController
  
 
  
  def show
  end
  
  
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.create(answer_params)
    @answer = Answer.find(@answer.id)
    @answer = @answer.content

    @tweet =  Tweet.find(params[:tweet_id])
    @tweet_content = @tweet.content
    @tweet_point = @tweet.point
    render action: :show
  end

end


private

def answer_params
params.require(:answer).permit(:content, :tweet_id).merge(tweet_id: params[:tweet_id])
end
