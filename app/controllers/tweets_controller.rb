class TweetsController < ApplicationController


  def index
    @tweets = Tweet.all.limit(4)
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.delete
    redirect_to action: :index
  end

 def update
  @tweet = Tweet.update(tweet_params)
  flash[:notice] = '編集できました。' if @tweet.save
  redirect_to action: :index
 end


  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      flash[:notice] = '投稿できました。'
      redirect_to action: :index
    else
      flash[:notice] = 'メッセージを入力してください。'
      redirect_to action: :new
    end
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to action: :index
  end



  def new
   @tweet = Tweet.new
  end

  def select
  end
  
private

  def tweet_params
  params.require(:tweet).permit(:content, :point, :title)
  end

end



