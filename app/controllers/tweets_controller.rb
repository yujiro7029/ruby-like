class TweetsController < ApplicationController

  before_action :find_tweet,only:[:update,:show,:edit,:destroy]
  before_action :set_tweet,only:[:new,:select,:description]


  def index
    @tweets = Tweet.all.limit(4)
  end

  def show
    @comments = Comment.all.limit(3)
  end

  def edit
    if @tweet.type_problem == 2
      render action: :select
    else
      render action: :description
    end
  end

  def destroy
    @tweet.delete
    flash[:notice] = '削除しました'
    redirect_to action: :index
  end

 def update
  @tweet = @tweet.update(tweet_params)
      flash[:notice] = '編集できました。' 
      redirect_to action: :index
  end


  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      flash[:notice] = '投稿できました'
      redirect_to action: :index
    else
      flash[:notice] = 'メッセージを入力してください。'
      redirect_to action: :new
    end
  end

  def new
  end
   

  # 選択問題2
  def select
  end

  # 記述問題1
  def description
  end



  
private

  def tweet_params
    params.require(:tweet).permit(:content, :point,:title,:type_problem,:select_problem1,:select_problem2,:select_problem3,:select_problem4,:select_problem5)
  end

  def set_tweet
    @tweet = Tweet.new
  end

  def find_tweet
    @tweet = Tweet.find(params[:id])   
  end

end



