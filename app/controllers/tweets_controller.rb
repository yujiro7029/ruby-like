class TweetsController < ApplicationController

  before_action :find_tweet,only:[:update,:show,:edit,:destroy]
  before_action :find_answer_result,only:[:show]
  before_action :find_answer_result,only:[:show]
  before_action :set_tweet,only:[:new,:select,:description]
  before_action :authenticate_user!,except:[:index,:show,:select_problem,:description_problem,:new_tweet]
  before_action :calculate,only:[:show]


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
    @result = @correct_answer.count.to_f / (@number.count).round(1) if @correct_answer.present? &&  @number.present?
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

  #問題検索
  def search
    @all_problems = Tweet.all.limit(100)
    @problems = params[:page][:name]
    @tweet_search = Tweet.tweet_search( @problems) if @problems.present?
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

  def find_answer_result
    @check_answer_result = AnswerResult.where(tweet_id: @tweet.id,user_id: current_user&.id).first
    @check_answer = Answer.where(tweet_id: @tweet.id,user_id: current_user&.id).first
  end

  #回答数や正答率を出すにあたり必要なデーターを取得
  def calculate
    @number = Answer.where(tweet_id: @tweet.id)
    @correct_answer = AnswerResult.where(tweet_id: @tweet.id,result: 1)
  end

end



