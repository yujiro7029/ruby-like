class AnswersController < ApplicationController
  before_action :find_tweet,only:[:index,:new,:update,:show,:edit,:destroy]
  before_action :find_answer,only:[:update,:show,:edit,:destroy]
  before_action :set_answer,only:[:index,:new]

  def index   
   
  end
  
  def show
  end
  

  def new
  end


  def create
    @answer = Answer.create(answer_params)
    if @answer.save
      flash[:notice] = '投稿できました'
      redirect_to action: :index
    else
      flash[:notice] = 'メッセージを入力してください。'
      redirect_to action: :new
    end
  end

private

  def answer_params
   params.require(:answer).permit(:content, :tweet_id).merge(tweet_id: params[:tweet_id])
  end

  def find_tweet
    @tweet = Tweet.find(params[:tweet_id])   
  end

  def find_answer
    @answer = Answer.find(params[:tweet_id])
  end
 
  def set_answer
    @answer = Answer.new 
  end

end



