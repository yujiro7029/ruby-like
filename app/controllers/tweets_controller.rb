class TweetsController < ApplicationController

  before_action :find_tweet,only:[:update,:show,:edit,:destroy]
  before_action :set_tweet,only:[:new,:select,:description]
  before_action :authenticate_user!,except:[:index,:show]

# セレクトが２記述が１
  def index
    @select_problem = Tweet.type(2).limit(4)
    @description_problem = Tweet.type(1).limit(4)
    @new_tweet = Tweet.new_problem.limit(4)
  end

  def select_problem
    @select_problem = Tweet.type(2)
  end

  def description_problem
    @description_problem = Tweet.type(1)
  end

  def new_tweet
    @new_tweet = Tweet.new_problem
  end

  def new
  end
  

  def show
    @comments = @tweet.comments.limit(3)
  end

  def edit
    if @tweet.type_problem == 2
      render "tweets/select"
    else
      render "tweets/description"
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
      flash[:notice] = '投稿できませんでした。'
      redirect_to action: :new
    end
  end


private
  def tweet_params
    params.require(:tweet).permit(
      :content,
      :point,:title,
      :type_problem,
      :select_problem1,
      :select_problem2,
      :select_problem3,
      :select_problem4,
      :select_problem5,
      :judge_problem1,
      :judge_problem2,
      :judge_problem3,
      :judge_problem4,
      :judge_problem5  
    ).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.new
  end

  def find_tweet
    @tweet = Tweet.find(params[:id])   
  end

end



